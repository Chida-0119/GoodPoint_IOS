//
//  MyProfile.swift
//  GoodPoint_IOS_Prot
//
//  Created by 千田伸一郎 on 2020/02/21.
//  Copyright © 2020 千田伸一郎. All rights reserved.
//

import Foundation

//var myProfile = MyProfile()

final class MyProfile : ObservableObject {
    var isSet: Bool = false
    var employees:[Employee] = employeeData
    var me: Employee = employeeData[0]
    @Published var index : Int = 0 {
        didSet{
            self.me = self.employees[self.index]
//            self.name = self.employees[self.index].name
//            self.address = self.employees[self.index].address
//            self.privateKey = self.employees[self.index].privateKey
//            if ethAccess.changeWallet(address: self.address, privateKey: self.privateKey) {}
//            self.image = self.employees[self.index].image
        }
    }
//    var name = "千田　伸一郎"
//    var address  = "0x6b0eEa30d84F0B88e07d7c649e3D0cbe8D3F15c3"
//    var privateKey = "67d6b6fdb373ac2d054e369c0debd0aba03ab6ded4299f0c81ec2bcae5f67070"
//    var image = employeeData[0].image
}
