//
//  AppDelegate.swift
//  SSS
//
//  Created by Артем Валиев on 01.06.17.
//  Copyright © 2017 Артем Валиев. All rights reserved.
//

import Apollo

let apollo = Apollo()

class Apollo {
    private var apollo: ApolloClient?
    
    var client: ApolloClient {
        get {
            let configuration = URLSessionConfiguration.default
            
            if let token = CurrentUser.getToken() {
                configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(token)"]
            }
            let url = URL(string: "http://localhost:8080/graphql")!
            self.apollo = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
            return self.apollo!
        }
    }
}
