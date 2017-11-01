import Vapor
import HTTP

final class JWTMiddleware: Middleware {
    func respond(to request: Request, chainingTo next: Responder) throws -> Response {
        guard let token = request.headers["Authorization"]?.string else {
            return try Response(status: Status.forbidden, json: JSON(node: ["error": "Authentication token missing", "status": 403]))
        }
        if token.verify() {
            return try next.respond(to: request)
        } else {
            return try Response(status: Status.forbidden, json: JSON(node: ["error": "Authentication token not verified", "status": 403]))
        }
    }
}
