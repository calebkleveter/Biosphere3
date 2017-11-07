import Vapor
import JWT

final class JWTController {
    let drop: Droplet
    
    init(drop: Droplet) {
        self.drop = drop
    }
    
    func configureRoutes() {
        // Add contoller routes to 'token' droplet group.
        let token = drop.grouped("token").grouped(APIErrorMiddleware())
        token.get("verify", handler: verify)
    }
    
    func verify(_ request: Request)throws -> ResponseRepresentable {
        // Get the JWT token from the request object.
        guard let jwt = request.headers["Authorization"]?.string else {
            // 'Authorization' header does not exist. Abort.
            throw Abort(.badRequest, reason: "Missing Authorization header")
        }
        do {
            // Verify the JWT token.
            try jwt.verify()
            // Verification succeded. Return true.
            return try JSON(node: ["verified": true])
        } catch {
            // Verification failed. Return false.
            return try JSON(node: ["verified": false])
        }
    }
}
