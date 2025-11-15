# ADNetwork

ADNetwork is a lightweight Swift networking layer that wraps `URLSession` to fetch raw `Data`, deserialize JSON dictionaries, or decode strongly typed `Codable` models. It ships as a Swift Package that targets iOS 15+ and macOS 11+, making it easy to embed in apps or shared frameworks.

## Requirements
- Swift 5.6+
- Xcode 15 or SwiftPM CLI
- iOS 15 / macOS 11 deployment targets

## Installation
Add the repository URL to your Xcode project or `Package.swift` dependencies:

```swift
.package(url: "https://github.com/AllDmeat/ADNetwork.git", from: "1.0.0")
```

Then add `ADNetwork` to your target dependencies.

## Usage
Create an instance and call one of the fetch helpers:

```swift
import ADNetwork

let network = ADNetwork()
let request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/todos/1")!)

Task {
    let todo: Todo = try await network.model(for: request, with: Todo.self)
    print(todo.title)
}
```

You can also plug in an `AuthErrorHandler` to centralize token refresh logic or use `URLSession.syncDataTask` from `Helpers/` for synchronous flows.

## Building & Testing
- `swift build` – compiles the package for the active SDK
- `swift test --parallel` – runs async XCTest coverage defined in `Tests/ADNetworkTests`
- `xcodebuild test -scheme ADNetwork-Package -destination 'platform=iOS Simulator,name=iPhone 15'` – mirrors CI simulator runs

Run commands from the repo root so SwiftPM locates `Package.swift`.

## Contributing
See `AGENTS.md` for repository guidelines, coding standards, and commit/PR expectations. Pull requests should include passing test output and reference any related issues.
