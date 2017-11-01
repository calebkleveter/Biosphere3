import Vapor
import HTTP

final class JWTMiddleware: Middleware {
    func respond(to request: Request, chainingTo next: Responder) throws -> Response {
        guard let token = request.headers["Authorization"]?.string else {
            return try Response(status: Status.forbidden, json: JSON(node: ["error": "Authentication token missing", "status": 403]))
        }
        do {
            try token.verify()
            return try next.respond(to: request)
        } catch let error as JWTFailure {
            return try Response(status: Status.forbidden, json: JSON(node: ["error": error.description, "status": 403]))
        }
    }
}
