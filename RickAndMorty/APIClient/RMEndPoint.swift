//
//  RMEndPoint.swift
//  RickAndMorty
//
//  Created by kunal wadekar on 27/07/24.
//

import Foundation

// @frozen is used to say that this enum won't be changing in future version of the libraray or framework. It helps compiler to make certain optimizations.


/// Represents unique API endpoints (Endpoints are path that comes after the baseURL)
@frozen enum RMEndPoint: String {
    case character
    case location
    case episode
}
