//
//  AppDelegate.swift
//  SSS
//
//  Created by Артем Валиев on 01.06.17.
//  Copyright © 2017 Артем Валиев. All rights reserved.
//

import Apollo




#if targetEnvironment(simulator)
    let isSimulator = true
#else
    let isSimulator = false
#endif

let apollo = Apollo()

class Apollo {
    private var apollo: ApolloClient?
    
    var client: ApolloClient {
        get {
            let configuration = URLSessionConfiguration.default
            
            if let token = CurrentUser.getToken() {
                configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(token)"]
            }
            
            let url: URL
            if isSimulator {
                url = URL(string: "http://localhost:8080/graphql")!
            } else {
                url = URL(string: "http://192.168.1.63:8080/graphql")!
            }
            
            self.apollo = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
            return self.apollo!
        }
    }
}
