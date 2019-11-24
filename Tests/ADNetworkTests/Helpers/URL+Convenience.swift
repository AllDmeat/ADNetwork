import Foundation

extension URL {
    struct Example {
        struct Correct {
            static let json = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
            static let google = URL(string: "https://google.com")!
        }
        
        struct Incorrect {
            static let invalidUrl = URL(string: "https://gooooogle.com")!
        }
    }
}
