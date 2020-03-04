//
//  EmployeeRow.swift
//  GoodPoint_IOS_Prot
//
//  Created by 千田伸一郎 on 2020/02/14.
//  Copyright © 2020 千田伸一郎. All rights reserved.
//

import SwiftUI

struct EmployeeRow: View {
    @EnvironmentObject var pointData: PointData
    var employee: Employee
    var showGrantted: Bool = false
    var showGiven: Bool = true


    var body: some View {
        HStack {
            employee.image
                .resizable()
                .frame(width: 45, height: 45)
            Text(employee.name)
            VStack{
            Spacer()
                if showGrantted {
                    Text("付与ポイント：　\(pointData.granted[self.employee.address]!)")
                }
                if showGiven {
                    Text("獲得ポイント：　\(pointData.given[self.employee.address]!)")
                }
                //.font(Font.custom("AppleSDGothicNeo-UltraLight", size: 17.0))
            }
            Spacer()
        }
    }
}

struct EmployeeRow_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            EmployeeRow(employee: employeeData[0])
            EmployeeRow(employee: employeeData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
