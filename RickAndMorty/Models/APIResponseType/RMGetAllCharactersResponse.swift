//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by kunal wadekar on 28/07/24.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}
