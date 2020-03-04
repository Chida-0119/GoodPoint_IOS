//
//  EmployeeDetail.swift
//  GoodPoint_IOS_Prot
//
//  Created by 千田伸一郎 on 2020/02/21.
//  Copyright © 2020 千田伸一郎. All rights reserved.
//

import SwiftUI

struct EmployeeDetail: View {
    @EnvironmentObject var pointData: PointData
    @State private var amount = "0"
    @State private var invalid:Bool = false
    var employee: Employee
    var myProfile: MyProfile

    
    var body: some View {
        List{
            HStack {
                self.myProfile.me.image
                    .resizable()
                    .frame(width: 45, height: 45)
                Text(self.myProfile.me.name)
                VStack{
                Spacer()
                    Text("付与ポイント：　\(pointData.granted[self.employee.address]!)")
                    //.font(Font.custom("AppleSDGothicNeo-UltraLight", size: 17.0))
                }
            }
            Text("↓").foregroundColor(.red).fontWeight(.bold)
      //    Section(header: Text("自分のポイント： \(pointData.granted[self.myProfile.address]!)")) {

                EmployeeRow(employee: employee)
                //Text("送り先： \(employee.name)")
                HStack {
                    Text("送るポイント：")
                    TextField("Amount", text: $amount )
                    .keyboardType(.numberPad)
//                    , onEditingChanged: { begin in
//                        if begin {
//                            self.invalid = false
//                        } else {
//                            self.pointData.granted[self.employee.address] = self.amount.trimmingCharacters(in: .whitespacesAndNewlines)
//                        }}, onCommit: validate )
                }
       //     }
            Spacer()
            Button(action:{
                ethAccess.sendTransction(toAddress:self.employee.address, value:self.amount)
                print("送信！ \(self.amount)")
                if self.pointData.refresh(ethAccess: ethAccess) {}
                self.amount = "0"
            }) {
                HStack {
                    Image(systemName: "suit.heart.fill")
                    Text("ありがとう")
                }
                .accentColor(.blue)
            }
        }
    }

    func validate() {
        if self.amount == ""  {
            self.invalid = true
        }
    }
}

struct EmployeeDetail_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDetail(employee: employeeData[0], myProfile: myProfile).environmentObject(PointData())
    }
}

