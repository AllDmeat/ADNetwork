import Foundation

extension URLSession {
    public func syncDataTask(with request: URLRequest) -> (Data?, URLResponse?, Error?) {
        var data: Data?
        var response: URLResponse?
        var error: Error?
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let dataTask = self.dataTask(with: request) {
            data = $0
            response = $1
            error = $2
            
            semaphore.signal()
        }
        dataTask.resume()
        
        _ = semaphore.wait()
        
        return (data, response, error)
    }
    
    private var timeout: DispatchTime {
        return DispatchTime.now() + DispatchTimeInterval.seconds(Int(self.configuration.timeoutIntervalForRequest))
    }
}