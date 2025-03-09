# NetworkService  

A lightweight and flexible Swift package for handling network requests using async/await. This package provides a clean architecture with `Requestable`, `Endpoint`, and `NetworkServiceProtocol` to simplify API calls.  

## Features  

- Supports async/await for modern Swift concurrency.  
- Configurable `NetworkService` with dependency injection.  
- `Endpoint` abstraction for defining API routes.  
- Custom error handling with `NetworkError`.  
- Support for URL query parameters and custom headers.  
- Lightweight and easy to integrate.  

## Installation  

### Swift Package Manager (SPM)  

To integrate `NetworkService` into your project, add the following dependency to your `Package.swift` file:  

```swift
.package(url: "https://github.com/your-repo/NetworkService.git", from: "1.0.0"),
```

Then, add it as a dependency in your target:  

```swift
.target(
    name: "YourTarget",
    dependencies: ["NetworkService"]
),
```

## Usage  

### 1. Define Network Configuration  

Create a struct conforming to `NetworkConfiguration` to define the base URL and global headers.  

```swift
struct APIConfiguration: NetworkConfiguration {
    var baseURL: String { "https://api.example.com" }
    var headers: [String: String] { ["Content-Type": "application/json"] }
}
```

### 2. Create an Endpoint  

Define an API endpoint using the `Endpoint` class.  

```swift
let getUsersEndpoint = Endpoint(
    path: "/users",
    method: .get
)
```

### 3. Make a Network Request  

Use `NetworkService` to fetch data asynchronously.  

```swift
let networkService = NetworkService(config: APIConfiguration())

Task {
    do {
        let users: [User] = try await networkService.request(endpoint: getUsersEndpoint)
        print(users)
    } catch {
        print("Error: \(error)")
    }
}
```

## Error Handling  

`NetworkError` handles various failure cases:  

- `.invalidURL` – When the URL construction fails.  
- `.requestFailed(Error)` – If the request encounters an error.  
- `.decodingError(Error)` – When decoding fails.  
