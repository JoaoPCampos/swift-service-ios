//
//  Http.swift
//  SwiftService
//
//  Created by João Campos on 26/04/2019.
//

import Foundation

public enum Http {
    
    enum Header: String {
        
        case accept = "Accept"
        case accept_chartset = "Accept-Charset"
        case accept_encoding = "Accept-Encoding"
        case accept_language = "Accept-Language"
        case authorization = "Authorization"
        case content_length = "Content-Length"
        case content_type = "Content-Type"
        case date = "Date"
        case range = "Range"
    }
    
    enum Method: String {
        
        case get
        case post
        case put
        case delete
    }
}
