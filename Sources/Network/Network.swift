import Foundation

public typealias JSON = [String: Any]

public class Network {
    private let urlSession: URLSession
    
    init(with urlSession: URLSession = URLSession(configuration: .default)) {
        self.urlSession = urlSession
    }
    
    public func data(for request: URLRequest) throws -> Data {
        let (data, _, error) = urlSession.syncDataTask(with: request)
        if let error = error {
            throw error
        }
        
        if let data = data {
            return data
        }
        
        throw NetworkError.noData
    }
    
    public func json(for request: URLRequest) throws -> JSON {
        let data = try self.data(for: request)
        
        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON {
            return json
        }
        
        throw NetworkError.dataIsNotJSON
    }
    
    public func model<Model: Codable>(for request: URLRequest,
                                      with type: Model.Type) throws -> Model {
        let data = try self.data(for: request)
        return try JSONDecoder().decode(type, from: data)
    }
}
