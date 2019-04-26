//
//  ServiceError.swift
//  SwiftService
//
//  Created by João Campos on 26/04/2019.
//

import Foundation

class ServiceError: Error {
    
    enum ErrorType: Int {
        case missing = 409
        case forbidden = 403
        case not_allowed = 405
        case invalid = 401
        case unknown
    }
    
    // MARK: - Properties
    let type: ErrorType
    let message: String

    init() {
        self.type = .unknown
        self.message = "No Message"
    }

    init(type: ErrorType, message: String) {
        self.type = type
        self.message = message
    }

    init(code: Int, dictionary: [String: Any]) {
        self.type = ErrorType.init(rawValue: code) ?? .unknown
        self.message = (dictionary["message"] as? String) ?? "No Message"
    }
}
