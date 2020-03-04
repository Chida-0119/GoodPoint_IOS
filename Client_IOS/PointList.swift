//
//  PointList.swift
//  GoodPoint_IOS_Prot
//
//  Created by 千田伸一郎 on 2020/02/25.
//  Copyright © 2020 千田伸一郎. All rights reserved.
//

import SwiftUI

struct PointList: View {
    
    var body: some View {
        List {
            if pointData.refresh(ethAccess: ethAccess) {}
            ForEach(employeeData) { ee in
                EmployeeRow(employee: ee, showGrantted: true)
                    .environmentObject(pointData)
                }
            }
    }
}


struct PointList_Previews: PreviewProvider {
    static var previews: some View {
        PointList()
    }
}
