//
//  Settings.swift
//  GoodPoint_IOS_Prot
//
//  Created by 千田伸一郎 on 2020/02/25.
//  Copyright © 2020 千田伸一郎. All rights reserved.
//

import SwiftUI

struct Settings: View {
    
    @EnvironmentObject var myProfile: MyProfile
    @EnvironmentObject var connectConfig: ConnectConfig

    var body: some View {
        
        TabView {
            MyWallet().environmentObject(self.myProfile)
            .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("プロファイル")
                }
            NetworkConnection().environmentObject(connectConfig)
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("接続")
                }
        }
        .font(.headline)    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
            .environmentObject(MyProfile())
            .environmentObject(ConnectConfig())
    }
}
