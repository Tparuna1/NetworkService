//
//  NetworkConfiguration.swift
//  
//
//  Created by tornike <parunashvili on 01.09.24.
//

import Foundation

/// Protocol for configuring network requests.
public protocol NetworkConfiguration {
    /// The base URL for all requests.
    var baseURL: String { get }
    
    /// Common headers for all requests.
    var headers: [String: String] { get }
}
