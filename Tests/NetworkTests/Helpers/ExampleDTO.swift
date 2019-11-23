import Foundation

struct DTO {
    struct Example {
        struct Correct: Codable {
            let title: String
            let userId: Int
            let id: Int
            let completed: Bool
        }
        
        struct Incorrect: Codable {
            let title: String
            let userId: Int
            let id: Int
            let completed: Bool
            let additionalField: Bool
        }
    }
}
