//
//  BaseStatusCode.swift
//  SwiftService
//
//  Created by João Campos on 05/11/2020.
//  Copyright © 2020 João Campos. All rights reserved.
//

public class BaseStatusCode {
    
    lazy var codes: [Int] = {
        
        let clientErrorCodes: [Int] = Array(400...451)
        let serverErrorCodes: [Int] = Array(500...511)
        
        return clientErrorCodes + serverErrorCodes
    }()
    
    let descriptions: [String] = ["Bad Request",
                                  "Unauthorized",
                                  "Payment Required",
                                  "Forbidden",
                                  "Not Found",
                                  "Method Not Allowed",
                                  "Not Acceptable",
                                  "Proxy Authentication Required",
                                  "Request Timeout",
                                  "Conflict",
                                  "Gone",
                                  "Length Required",
                                  "Precondition Failed",
                                  "Payload Too Large",
                                  "URI Too Long",
                                  "Unsupported Media Type",
                                  "Requested Range Not Satisfiable",
                                  "Expectation Failed",
                                  "I'm a teapot",
                                  "Misdirected Request",
                                  "Unprocessable Entity",
                                  "Locked",
                                  "Failed Dependency",
                                  "Too Early",
                                  "Upgrade Required",
                                  "Precondition Required",
                                  "Too Many Requests",
                                  "Request Header Fields Too Large",
                                  "Unavailable For Legal Reasons",
                                  "Internal Server Error",
                                  "Not Implemented",
                                  "Bad Gateway",
                                  "Service Unavailable",
                                  "Gateway Timeout",
                                  "HTTP Version Not Supported",
                                  "Variant Also Negotiates",
                                  "Insufficient Storage",
                                  "Loop Detected",
                                  "Not Extended",
                                  "Network Authentication Required"]
}
