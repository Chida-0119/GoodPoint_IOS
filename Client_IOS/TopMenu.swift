//
//  TopMenu.swift
//  GoodPoint_IOS_Prot
//
//  Created by 千田伸一郎 on 2020/02/21.
//  Copyright © 2020 千田伸一郎. All rights reserved.
//

import SwiftUI

//var ethAccess : EthAccess

var pointData :PointData = PointData()
var myProfile :MyProfile = MyProfile()
var connectConfig :ConnectConfig = ConnectConfig()

struct TopMenu: View {
    @State var showingSettings = false


    var SettingButton: some View {
        Button(action: { self.showingSettings.toggle() }) {
            HStack {
 //               Image(systemName: "pencil.tip.crop.circle")
 //                   .imageScale(.large)
 //                   .accessibility(label: Text("User Profile"))
 //                   .padding()
                Text("設定")
            }
        }
    }
        
    var body: some View {
        NavigationView {
            List{
                Spacer()
//                NavigationLink(destination: Settings()
//                    .environmentObject(myProfile)
//                    .environmentObject(connectConfig)){
//                        Text("設定")
//                }
                if pointData.refresh(ethAccess: ethAccess) {
                NavigationLink(destination: EmployeeRow(employee: myProfile.me)
                  .environmentObject(pointData)
                ) {
                    Text("自分のポイントを見る")
                }
                NavigationLink(destination: EmployeeDirectory()
                  .environmentObject(myProfile)
                ) {
                //.environmentObject(pointData)){
                    Text("ポイントを送る")
                }
                NavigationLink(destination: HelloWorld()){
                    Text("ポイントを使う")
                }
                NavigationLink(destination: PointList()){
                    Text("ポイント一覧参照")
                }
                }
            }
            .navigationBarTitle(Text("いいねポイント"))
            .navigationBarItems(trailing: SettingButton)
            .sheet(isPresented: $showingSettings) {
                Settings()
                    .environmentObject(myProfile)
                    .environmentObject(connectConfig)
                    .onDisappear() {
                        ethAccess = EthAccess(con: connectConfig, prof: myProfile)
                    }
            }

        }
    }
}

struct TopMenu_Previews: PreviewProvider {
    static var previews: some View {
        TopMenu()
    }
}
