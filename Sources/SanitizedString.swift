//
//  SanitizedString.swift
//  
//
//  Created by Kyle Bashour on 2/19/16.
//
//

import Foundation

typealias UserInput = String

struct SanitizedString {
    
    let value: String
    
    init(_ input: UserInput) {
        value = SanitizedString.sanitize(input)
    }
    
    private static func sanitize(input: UserInput) -> String {
        return input.stringByReplacingOccurrencesOfString("'", withString: "''")
    }
}
