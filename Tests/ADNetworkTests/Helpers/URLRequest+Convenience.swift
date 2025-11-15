import Foundation

extension URLRequest {
    enum Example {
        enum Correct {
            static let json = URLRequest(url: URL.Example.Correct.json)
            static let html = URLRequest(url: URL.Example.Correct.google)
        }

        enum Incorrect {
            static let invalidUrl: URLRequest = {
                var request = URLRequest(url: URL.Example.Incorrect.invalidUrl)
                request.timeoutInterval = 1
                return request
            }()
        }
    }
}
