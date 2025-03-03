//
//  URLSessionExtension.swift
//  TornikeParunashviliPOQ
//
//  Created by tornike <parunashvili on 03.09.24.
//

import Foundation

/// Provides an asynchronous method for fetching data from a URL using URLSession.
extension URLSession {
    /// Asynchronously fetches data and a URL response for a given URL.
    ///
    /// - Parameter url: The URL to fetch data from.
    /// - Returns: A tuple containing the fetched data and the URL response.
    /// - Throws: An error if the request fails or the data is invalid.
    @available(iOS, deprecated: 15.0, message: "This extension is no longer necessary. Use API built into SDK")
    func data(from url: URL) async throws -> (Data, URLResponse) {
        try await withCheckedThrowingContinuation { [weak self] continuation in
            let task = self?.dataTask(with: url) { data, response, error in
                guard let data = data, let response = response else {
                    let error = error ?? URLError(.badServerResponse)
                    return continuation.resume(throwing: error)
                }
                
                continuation.resume(returning: (data, response))
            }
            
            task?.resume()
        }
    }
}
