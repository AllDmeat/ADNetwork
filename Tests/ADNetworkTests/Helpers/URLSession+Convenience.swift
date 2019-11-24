import Foundation

extension URLSession {
    convenience init(with timeout: TimeInterval = TimeInterval.Timeout.short) {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = timeout
        configuration.timeoutIntervalForRequest = timeout
        self.init(configuration: configuration)
    }
}
