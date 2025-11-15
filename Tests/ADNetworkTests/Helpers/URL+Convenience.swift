import Foundation

extension URL {
    enum Example {
        enum Correct {
            static let json = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
            static let google = URL(string: "https://google.com")!
        }

        enum Incorrect {
            static let invalidUrl = URL(string: "https://gooooogle.com")!
        }
    }
}
