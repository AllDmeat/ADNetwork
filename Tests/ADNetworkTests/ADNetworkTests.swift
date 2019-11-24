import XCTest
@testable import ADNetwork

final class ADNetworkTests: XCTestCase {
    var network: ADNetwork!
    
    func test_DataIsLoaded_When_URLIsCorrect() throws {
        let request = URLRequest.Example.Correct.json
        XCTAssertNoThrow(try network.data(for: request))
    }


    func test_DataIsNotLoaded_AndErrorThrown_When_URLIsIncorrect() throws {
        let session = URLSession(with: TimeInterval.Timeout.short)
        let network = ADNetwork(with: session)
        let request = URLRequest.Example.Incorrect.invalidUrl
        XCTAssertThrowsError(try network.data(for: request))
    }
}

extension ADNetworkTests {
    func test_JsonIsLoaded_When_ResponseIsJson() {
        let request = URLRequest.Example.Correct.json
        XCTAssertNoThrow(try network.json(for: request))
    }
    
    func test_JsonIsNotLoaded_AndErrorThrown_When_ResponseIsNotJson() {
        let request = URLRequest.Example.Correct.html
        XCTAssertThrowsError(try network.json(for: request))
    }
}

extension ADNetworkTests {
    func test_ModelIsLoaded_When_DtoIsCorrect() {
        let request = URLRequest.Example.Correct.json
        XCTAssertNoThrow(try network.model(for: request, with: DTO.Example.Correct.self))
    }
    
    func test_ModelIsNotLoaded_When_DtoIsWrong() {
        let request = URLRequest.Example.Correct.json
        XCTAssertThrowsError(try network.model(for: request, with: DTO.Example.Incorrect.self))
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
