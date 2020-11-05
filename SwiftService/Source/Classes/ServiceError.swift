//
//  ServiceError.swift
//  SwiftService
//
//  Created by João Campos on 26/04/2019.
//

import Foundation

public final class ServiceError: Error {
    
    // MARK: - Properties
    public let dictionary: [String: Any]
    public let statusCode: StatusCode

    public init() {
        
        self.statusCode = StatusCode()
        self.dictionary = [:]
    }

    public init(statusCode: StatusCode, dictionary: [String: Any] = [:]) {
        
        self.statusCode = statusCode
        self.dictionary = dictionary
    }
}
