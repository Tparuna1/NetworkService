// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public final class NetworkService: NetworkServiceProtocol {
    private let config: NetworkConfiguration
    private let session: URLSession

    /// Initializes a new `NetworkService`.
    /// - Parameters:
    ///   - config: The network configuration.
    ///   - session: The URLSession to use for requests. Defaults to `URLSession.shared`.
    public init(config: NetworkConfiguration, session: URLSession = .shared) {
        self.config = config
        self.session = session
    }

    public func request<R: Decodable>(endpoint: Endpoint) async throws -> R {
        guard let url = try? endpoint.url(with: config) else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headerParameters.merging(config.headers) { current, _ in current }

        let (data, response) = try await session.data(from: request.url!)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.requestFailed(URLError(.badServerResponse))
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(R.self, from: data)
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}
