//
//  NetworkConnection.swift
//  GoodPoint_IOS_Prot
//
//  Created by 千田伸一郎 on 2020/02/25.
//  Copyright © 2020 千田伸一郎. All rights reserved.
//

import SwiftUI


struct NetworkConnection: View {
    @EnvironmentObject var connectConfig: ConnectConfig
    //@State var isProxyEnable = false
    var body: some View {
        List{
            Text("接続先：\(connectConfig.destination.name)")
            Text("EndPoint：\(connectConfig.destination.endpoint)")
            Toggle("Proxy有効", isOn: $connectConfig.isProxyEnable)
            if self.connectConfig.isProxyEnable {
                HStack {
                    Text("アドレス").bold()
                    TextField("address", text: $connectConfig.proxyAddress)
                }
                HStack {
                    Text("ポート").bold()
                    TextField("port", text: $connectConfig.proxyPort)
                }
            }
        }
    }
}
    
struct NetworkConnection_Previews: PreviewProvider {
    static var previews: some View {
        NetworkConnection().environmentObject(ConnectConfig())
    }
}
