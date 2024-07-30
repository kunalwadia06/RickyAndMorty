//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by kunal wadekar on 27/07/24.
//

import Foundation

/// Object that represents a single API call
final class RMRequest {
    // Base URL
    // Endpoint
    // Path components
    // Query parameters
    
    /// API Constants
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
    private let endPoint: RMEndPoint
    
    /// Path components for API, if any
    private let pathComponents: [String]
    
    /// Query arguments for API, if any
    private let queryParameters: [URLQueryItem]
    
    /// constructed url for the API request in string format
    private var urlString: String {
        
        var string = Constants.baseURL
        string += "/"
        string += "\(endPoint.rawValue)/"   // character or location or episode
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "\($0)/"
            })
        }
        
        // query parameters means something like '?status=alive'. below we try to make and combine all the query paramenter to send as API Call url.
        if !queryParameters.isEmpty {
            string += "?"
            let argumetString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumetString
        }
        
        return string
    }
    
    /// Computed & Constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired HTTP method,. In this app, all the requests are GET
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    /// Construct request
    /// - Parameters:
    ///   - endPoint: Target endPoints
    ///   - pathComponents: Collection fo Path components
    ///   - queryParameters: Collection of Query parameters
    init(endPoint: RMEndPoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    
}

extension RMRequest {
    static let listCharactersRequests = RMRequest(endPoint: .character)
    static let listLocationsRequests = RMRequest(endPoint: .location)
    static let listEpisodesRequests = RMRequest(endPoint: .episode)
}
