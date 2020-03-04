//
//  PointData.swift
//  GoodPoint_IOS_Prot
//
//  Created by 千田伸一郎 on 2020/02/19.
//  Copyright © 2020 千田伸一郎. All rights reserved.
//

import Combine
import SwiftUI

//let ethAccess = EthAccess(con: connectConfig, prof: myProfile)

final class PointData: ObservableObject {
    @Published var isSet: Bool = false
    @Published var employees:[Employee] = employeeData
    @Published var granted: [String:String] = [:]
    @Published var given: [String:String] = [:]
    
    func refresh( ethAccess: EthAccess) -> Bool {
        for e in employees {
            self.given[e.address] = ethAccess.getBalance(address: e.address)!
            self.granted[e.address] = ethAccess.getGranted(address: e.address)!
        }
        return true
    }
}
