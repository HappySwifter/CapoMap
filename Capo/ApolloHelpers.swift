//
//  AppDelegate.swift
//  SSS
//
//  Created by Артем Валиев on 01.06.17.
//  Copyright © 2017 Артем Валиев. All rights reserved.
//

import Apollo




#if targetEnvironment(simulator)
    let serverURL = URL(string: "http://localhost:8080")!
#else
    let serverURL = URL(string: "http://192.168.1.63:8080")!
#endif

let apollo = ApolloHelper()

class ApolloHelper {
    private var apollo: ApolloClient?
    
    var client: ApolloClient {
        get {
            let configuration = URLSessionConfiguration.default
            
            if let token = CurrentUser.getToken() {
                configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(token)"]
            }
            
            self.apollo = ApolloClient(networkTransport: HTTPNetworkTransport(url: serverURL.appendingPathComponent("graphql"), configuration: configuration))
            return self.apollo!
        }
    }
}
