@testable import ADNetwork
import XCTest

final class ADNetworkTests: XCTestCase {
    var network: ADNetwork!

    func test_DataIsLoaded_When_URLIsCorrect() async throws {
        let request = URLRequest.Example.Correct.json
        let response = try await network.data(for: request)
        XCTAssertNotNil(response)
    }

    func test_DataIsNotLoaded_AndErrorThrown_When_URLIsIncorrect() async throws {
        let request = URLRequest.Example.Incorrect.invalidUrl

        do {
            _ = try await network.data(for: request)
            XCTFail("Should have thrown an error")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}

extension ADNetworkTests {
    func test_JsonIsLoaded_When_ResponseIsJson() async throws {
        let request = URLRequest.Example.Correct.json
        let response = try await network.json(for: request)
        XCTAssertNotNil(response)
    }

    func test_JsonIsNotLoaded_AndErrorThrown_When_ResponseIsNotJson() async throws {
        let request = URLRequest.Example.Correct.html

        do {
            _ = try await network.json(for: request)
            XCTFail("Should have thrown an error")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}

extension ADNetworkTests {
    func test_ModelIsLoaded_When_DtoIsCorrect() async throws {
        let request = URLRequest.Example.Correct.json
        let model = try await network.model(for: request, with: DTO.Example.Correct.self)
        XCTAssertEqual(model.title, "delectus aut autem")
        XCTAssertEqual(model.userId, 1)
        XCTAssertEqual(model.id, 1)
        XCTAssertEqual(model.completed, false)
    }

    func test_ModelIsNotLoaded_When_DtoIsWrong() async throws {
        let request = URLRequest.Example.Correct.json

        do {
            _ = try await network.model(for: request, with: DTO.Example.Incorrect.self)
            XCTFail("Should have thrown an error")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}

// MARK: - Setup

extension ADNetworkTests {
    override func setUp() {
        network = ADNetwork()
    }

    override func tearDown() {
        network = nil
    }
}
