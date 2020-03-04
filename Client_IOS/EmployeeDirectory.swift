//
//  EmployeeDirectory.swift
//  GoodPoint_IOS_Prot
//
//  Created by 千田伸一郎 on 2020/02/21.
//  Copyright © 2020 千田伸一郎. All rights reserved.
//

import SwiftUI

//let ethAccess = EthAccess(_privatekey: "67d6b6fdb373ac2d054e369c0debd0aba03ab6ded4299f0c81ec2bcae5f67070", _address: employeeData[0].address)

var ethAccess = EthAccess(con: connectConfig, prof: myProfile)

struct EmployeeDirectory: View {
    @EnvironmentObject var myProfile: MyProfile
    
    var body: some View {
        List {
            if pointData.refresh(ethAccess: ethAccess) {}
            ForEach(employeeData) { ee in
                if ee.name != self.myProfile.me.name {
                    NavigationLink(
                        destination: EmployeeDetail(employee: ee, myProfile: self.myProfile)
                        .environmentObject(pointData)
                        ){
                        EmployeeRow(employee: ee).environmentObject(pointData)
                    }
                }
            }
            .navigationBarTitle(Text("エフ社員一覧"))
        }
    }
}

struct EmployeeDirectory_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDirectory()
            .environmentObject(myProfile)
    }
}
