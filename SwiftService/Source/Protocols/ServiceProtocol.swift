//
//  ServiceProtocol.swift
//  SwiftService
//
//  Created by João Campos on 26/04/2019.
//

import Foundation

protocol ServiceProtocol {
    
    var path: String { get }
    var method: Http.Method { get }
    var parameters: [URLQueryItem]? { get }
    var headers: [Header] { get }
}
