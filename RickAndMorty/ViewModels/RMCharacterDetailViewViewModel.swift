//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by kunal wadekar on 02/08/24.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        return character.name.uppercased()
    }
}
