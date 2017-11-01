import Vapor
import HTTP

final class JWTMiddleware: Middleware {
    
    // Check to make sure that the JWT token in the
    // 'Authorization' header is valid
    func respond(to request: Request, chainingTo next: Responder) throws -> Response {
        // Get the token from the 'Authorization' header.
        guard let token = request.headers["Authorization"]?.string else {
            // 'Authorization' header does not exist. Return an error with status 403 (Forbidden).
            return try Response(status: Status.forbidden, json: JSON(node: ["error": "Authentication token missing", "status": 403]))
        }
        do {
            // Verify the JWT token from the request object.
            try token.verify()
            // Allow responder to complete.
            return try next.respond(to: request)
        } catch let error as JWTFailure {
            // JWT verification failed. Return an error with status 403 (Forbidden).
            return try Response(status: Status.forbidden, json: JSON(node: ["error": error.description, "status": 403]))
        }
    }
}
