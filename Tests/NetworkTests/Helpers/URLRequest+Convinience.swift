import Foundation

extension URLRequest {
    struct Example {
        struct Correct {
            static let json = URLRequest(url: URL.Example.Correct.json)
            static let html = URLRequest(url: URL.Example.Correct.google)
        }
        
        struct Incorrect {
            static let invalidUrl = URLRequest(url: URL.Example.Incorrect.invalidUrl)
        }
    }
}
