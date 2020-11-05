//
//  ServiceError.swift
//  SwiftService
//
//  Created by João Campos on 26/04/2019.
//

import Foundation

public final class ServiceError: Error {
    
    public enum ErrorType: Int {
        
        case missing = 409
        case forbidden = 403
        case not_allowed = 405
        case invalid = 401
        case unknown
    }
    
    // MARK: - Properties
    public let type: ErrorType
    public let dictionary: [String: Any]

    public init() {
        
        self.type = .unknown
        self.dictionary = [:]
    }

    public init(type: ErrorType, dictionary: [String: Any]) {
        
        self.type = type
        self.dictionary = dictionary
    }

    public init(code: Int, dictionary: [String: Any]) {
        
        self.type = ErrorType.init(rawValue: code) ?? .unknown
        self.dictionary = dictionary
    }
}
