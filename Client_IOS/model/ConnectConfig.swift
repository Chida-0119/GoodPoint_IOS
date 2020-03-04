//
//  ConnectConfig.swift
//  GoodPoint_IOS_Prot
//
//  Created by 千田伸一郎 on 2020/02/25.
//  Copyright © 2020 千田伸一郎. All rights reserved.
//

import Foundation

var destinations: [DestinationConfig] =
     [DestinationConfig("Local", "http://127.0.0.1:7545", "0x36F1A9af6458aCe117154eA854FE783f2000234D"),
      DestinationConfig("Eff_PoA", "http://23.102.73.125:8540","0x08b8916824BFD9D9E008273F82D15c59F30b5187")]

class DestinationConfig {
    var name : String = "Local"
    var endpoint : String = "http://127.0.0.1:7545"
    var tokenAddress : String = "0x36F1A9af6458aCe117154eA854FE783f2000234D"
    init(_ name: String, _ endpoint: String, _ tokenAddress: String){
        self.name = name
        self.endpoint = endpoint
        self.tokenAddress = tokenAddress
    }
    
}

class ConnectConfig : ObservableObject {
    var isSet: Bool = false
    @Published var destination : DestinationConfig = destinations[1]
    @Published var isProxyEnable : Bool = false
    @Published var proxyAddress : String = "192.168.100.1"
    @Published var proxyPort : String = "3128"
}
