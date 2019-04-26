//
//  ServiceEndPoint.swift
//  SwiftService
//
//  Created by João Campos on 26/04/2019.
//  Copyright © 2019 João Campos. All rights reserved.
//

import Foundation

public final class ServiceEndPoint {
    
    let scheme: Request.Scheme
    let baseUrl: String
    let path: String
    let key: String?
    
    init(scheme: Request.Scheme, baseUrl: String, path: String, key: String? = nil) {
        
        self.scheme = scheme
        self.baseUrl = baseUrl
        self.path = path
        self.key = key
    }
}
