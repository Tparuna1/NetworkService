//
//  NetworkRequest+URLBuilder.swift
//  
//
//  Created by tornike <parunashvili on 01.09.24.
//

import Foundation

// MARK: - URL Building
extension Requestable {
    /// Constructs the URL for the network request based on the request configuration.
    ///
    /// - Parameter config: The `NetworkConfiguration` containing the base URL and other settings.
    /// - Throws: A `NetworkError.invalidURL` if the URL construction fails.
    /// - Returns: The constructed URL for the network request.
    func url(with config: NetworkConfiguration) throws -> URL {
        guard let baseURL = URL(string: config.baseURL) else {
            throw NetworkError.invalidURL
        }
        
        let endpoint = baseURL.appendingPathComponent(path)

        guard var urlComponents = URLComponents(url: endpoint, resolvingAgainstBaseURL: true) else {
            throw NetworkError.invalidURL
        }

        var urlQueryItems = [URLQueryItem]()
        queryParameters.forEach {
            urlQueryItems.append(URLQueryItem(name: $0.key, value: "\($0.value)"))
        }

        urlComponents.queryItems = !urlQueryItems.isEmpty ? urlQueryItems : nil

        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }

        return url
    }
}
