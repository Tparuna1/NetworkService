//
//  NetworkServiceProtocol.swift
//  
//
//  Created by tornike <parunashvili on 01.09.24.
//

import Foundation

/// Protocol for making network requests.
public protocol NetworkServiceProtocol {
    /// Makes a network request.
    /// - Parameter endpoint: The endpoint to request.
    /// - Returns:  the response data or throws an error.
    func request<R: Decodable>(endpoint: Endpoint) async throws -> R
}
