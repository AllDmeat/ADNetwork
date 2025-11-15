import Foundation

enum DTO {
    enum Example {
        struct Correct: Decodable {
            let title: String
            let userId: Int
            let id: Int
            let completed: Bool
        }

        struct Incorrect: Decodable {
            let title: String
            let userId: Int
            let id: Int
            let completed: Bool
            let additionalField: Bool
        }
    }
}
