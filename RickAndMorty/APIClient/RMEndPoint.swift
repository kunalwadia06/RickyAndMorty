//
//  RMEndPoint.swift
//  RickAndMorty
//
//  Created by kunal wadekar on 27/07/24.
//

import Foundation

// @frozen is used to say that this enum won't be changing in future version of the libraray or framework. It helps compiler to make certain optimizations.


/// Represents unique API endpoints
@frozen enum RMEndPoint: String {
    /// endpoint to ger character info
    case character
    /// endpoint to ger location info
    case location
    /// endpoint to ger episode info
    case episode
}
