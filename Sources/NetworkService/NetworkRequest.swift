//
//  NetworkRequest.swift
//  
//
//  Created by tornike <parunashvili on 01.09.24.
//

import Foundation

/// Protocol for defining a network request.
public protocol Requestable {
    /// The path for the request.
    var path: String { get }
    
    /// The HTTP method for the request.
    var method: HTTPMethod { get }
    
    /// Headers specific to this request.
    var headerParameters: [String: String] { get }
    
    /// Query parameters for the request.
    var queryParameters: [String: Any] { get }
}
