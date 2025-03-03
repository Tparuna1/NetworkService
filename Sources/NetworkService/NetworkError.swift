//
//  NetworkError.swift
//  
//
//  Created by tornike <parunashvili on 01.09.24.
//

import Foundation

/// Errors that can occur during network requests.
public enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case decodingError(Error)
}
