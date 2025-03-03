//
//  Endpoint.swift
//
//
//  Created by tornike <parunashvili on 01.09.24.
//

import Foundation

/// A concrete implementation of `Requestable` for defining endpoints.
public final class Endpoint: Requestable {
    
    public let path: String
    public let method: HTTPMethod
    public let headerParameters: [String: String]
    public let queryParameters: [String: Any]
    
    /// Initializes a new `Endpoint`.
    /// - Parameters:
    ///   - path: The path for the request.
    ///   - method: The HTTP method for the request.
    ///   - headerParameters: Headers specific to this request.
    ///   - queryParameters: Query parameters for the request.
    public init(
        path: String,
        method: HTTPMethod,
        headerParameters: [String: String] = [:],
        queryParameters: [String: Any] = [:]
    ) {
        self.path = path
        self.method = method
        self.headerParameters = headerParameters
        self.queryParameters = queryParameters
    }
}
