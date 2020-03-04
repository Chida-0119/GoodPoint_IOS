//
//  MyWallet.swift
//  GoodPoint_IOS_Prot
//
//  Created by 千田伸一郎 on 2020/02/25.
//  Copyright © 2020 千田伸一郎. All rights reserved.
//

import SwiftUI


struct MyWallet: View {
    @State private var selection = 0
    @EnvironmentObject var myProfile: MyProfile

    var body: some View {
        NavigationView {
            VStack{
                Text("!!!!本来は、ここで自分のWallet 作成や、名前などの個人情報をここで設定します!!!!")
            Form {
                Picker(selection: $myProfile.index, label: Text("自分を選択")) {
                    ForEach(employeeData) {employee in
                        Text(employee.name)
                    }
                }
            }
            }
        }
    }
}

struct MyWallet_Previews: PreviewProvider {
    static var previews: some View {
        MyWallet()
    }
}
