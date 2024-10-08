//
//  RMService.swift
//  RickAndMorty
//
//  Created by kunal wadekar on 27/07/24.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService {
    
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    private enum RMRequestError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick and Morty API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        apiRequest request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void ) {
        
            guard let urlRequest = self.request(from: request) else {
                completion(.failure(RMRequestError.failedToCreateRequest))
                return
            }
            
            let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
                
                guard let data = data, error == nil else {
                    completion(.failure(RMRequestError.failedToGetData))
                    return
                }
                
                do{
                    let result = try JSONDecoder().decode(type.self, from: data)
                    completion(.success(result))
                }
                catch{
                    completion(.failure(error))
                }
            }
            
            task.resume()
    }
    
    public func requestt<T: Decodable>(urlString: String) async throws -> T {
        
        guard let url = URL(string: urlString) else {
            throw RMRequestError.failedToCreateRequest
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let dataResponse = try JSONDecoder().decode(T.self, from: data)
        print("========",dataResponse)
        return dataResponse
    }
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        
        guard let url = rmRequest.url else {return nil}
        
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        
        return request
    }
    
}
