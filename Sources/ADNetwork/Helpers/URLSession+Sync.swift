import Foundation

extension URLSession {
    public func syncDataTask(with request: URLRequest) -> (Data?, URLResponse?, Error?) {
        final class SyncResult: @unchecked Sendable {
            var data: Data?
            var response: URLResponse?
            var error: Error?
        }
        let result = SyncResult()

        let semaphore = DispatchSemaphore(value: 0)

        let dataTask = self.dataTask(with: request) {
            result.data = $0
            result.response = $1
            result.error = $2
            semaphore.signal()
        }
        dataTask.resume()

        semaphore.wait()

        return (result.data, result.response, result.error)
    }
}
