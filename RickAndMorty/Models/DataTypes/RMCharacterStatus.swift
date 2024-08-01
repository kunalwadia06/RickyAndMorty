//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by kunal wadekar on 27/07/24.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"    // put unknown in back-tik bcz 'unknown' can be a keyword in some version of swift
    
    var text: String{
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
