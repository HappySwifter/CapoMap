//
//  UIStringExtensions.swift
//  Capo
//
//  Created by Артем Валиев on 16/12/2018.
//  Copyright © 2018 Артем Валиев. All rights reserved.
//

import Foundation

extension String {
    var appendingServerURL: URL {
        get {
            return serverURL.appendingPathComponent(self)
        }
    }
}
