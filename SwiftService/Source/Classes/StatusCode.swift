//
//  StatusCode.swift
//  SwiftService
//
//  Created by João Campos on 05/11/2020.
//  Copyright © 2020 João Campos. All rights reserved.
//

private extension Array {
    
    subscript(index: Int, default defaultValue: @autoclosure () -> Element) -> Element {
        
        guard index >= 0, index < endIndex else {
            
            return defaultValue()
        }

        return self[index]
    }
}

public final class StatusCode: BaseStatusCode {
    
    public lazy var description: String = {
        
        if let description = self.customDescription { return description }
        
        guard let codeIndex = self.codes.firstIndex(of: self.value) else {
        
            return "Error code match not found for code \(self.value)"
        }
        
        return self.descriptions[codeIndex, default: "Error description match not found for code \(self.value)"]
    }()
    
    public let value: Int
    private let customDescription: String?
    
    public init(_ value: Int = -1, customDescription: String? = nil) {
        
        self.value = value
        self.customDescription = customDescription
    }
}
