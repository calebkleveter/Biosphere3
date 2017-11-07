import Vapor

extension Abort {
    static let missingRequestData = Abort(.badRequest, reason: "Missing data in request body")
    static let badUserID = Abort(.badRequest, reason: "Unable to find user for ID")
    static let missingJWTToken = Abort(.badRequest, reason: "Missing Authorization header")
}
