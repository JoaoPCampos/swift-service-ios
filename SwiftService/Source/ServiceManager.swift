//
//  ServiceManager.swift
//  SwiftService
//
//  Created by João Campos on 26/04/2019.
//  Copyright © 2019 João Campos. All rights reserved.
//

import Foundation

public class ServiceManager<T: Decodable> {
    
    private let service: ServiceProtocol
    private let log: Bool
    
    public init(service: ServiceProtocol, log: Bool = false) {
        
        self.service = service
        self.log = log
    }
}

// MARK: - Public
public extension ServiceManager {
    
    func request(success: @escaping (T) -> Void,
                 failure: @escaping (ServiceError) -> Void) {
        
        guard var urlComponents = URLComponents(string: self.service.path) else { return }
        
        urlComponents.queryItems = self.service.parameters
        
        guard let url = urlComponents.url else { return }
        
        var request = URLRequest(url: url)
        
        for header in self.service.headers {
            
            request.addValue(header.value, forHTTPHeaderField: header.key.rawValue)
        }
        
        request.httpMethod = self.service.method.rawValue.uppercased()
        request.httpBody = self.service.endpoint.body
        
        self.debug()
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, let httpStatus = response as? HTTPURLResponse, error == nil else {
                
                let description = error?.localizedDescription ?? "No error description found"
                
                failure(ServiceError(statusCode: StatusCode(customDescription: description)))
                
                return
            }
            
            if httpStatus.statusCode == 200, let object: T = self.decode(data) {
                
                success(object)
                
            } else {
                
                if let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] {
                    
                    let serviceError = ServiceError(statusCode: StatusCode(httpStatus.statusCode),
                                                    dictionary: responseObject)
                    
                    failure(serviceError)
                    
                } else {
                    
                    failure(ServiceError(statusCode: StatusCode(customDescription: "JSONSerialization failed")))
                }
            }
        }
        
        task.resume()
    }
}

// MARK: - Private
private extension ServiceManager {
    
    func decode<T: Decodable>(_ data: Data?) -> T? {
        
        guard let data = data else { return nil }
        
        do {
            
            let jsonDecoder = JSONDecoder()
            
            let responseBody = try jsonDecoder.decode(T.self, from: data)
            
            return responseBody
        }
        catch {
            
            //print("Decode failed with error:\n\(error)")
            return nil
        }
    }
    
    private func debug() {
        
        guard self.log else { return }
        
        print("### URL PATH ###")
        print(self.service.path)
        
        print("\n### PARAMETERS ###")
        print(self.service.parameters ?? [])
        
        print("\n### HEADERS ###")
        print(self.service.headers)
        
        print("\n### METHOD ###")
        print(self.service.method.rawValue + "\n\n")
        
        guard let data = self.service.endpoint.body else { return }
        
        let json = try? JSONDecoder().decode(T.self, from: data)
        
        print("\n### BODY ###")
        print(json.debugDescription + "\n\n")
    }
}
