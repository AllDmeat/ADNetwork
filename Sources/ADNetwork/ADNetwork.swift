import Foundation
import Synchronization

public typealias JSON = [String: Any]

final public class ADNetwork: Sendable {
    private let urlSession: URLSession

    public init(with urlSession: URLSession = URLSession(configuration: .default)) {
        self.urlSession = urlSession
    }

    public func data(for request: URLRequest) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }

    public func json(for request: URLRequest) async throws -> JSON {
        let data = try await data(for: request)

        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON {
            return json
        }

        throw ADNetworkError.dataIsNotJSON
    }

    public func model<Model: Decodable>(
        for request: URLRequest,
        with type: Model.Type
    ) async throws -> Model {
        let data = try await data(for: request)
        return try JSONDecoder().decode(type, from: data)
    }
}
