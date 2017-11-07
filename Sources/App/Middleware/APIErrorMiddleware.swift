import Vapor
import HTTP

final class APIErrorMiddleware: Middleware {
    func respond(to request: Request, chainingTo next: Responder) throws -> Response {
        do {
            return try next.respond(to: request)
        } catch let error as AbortError {
            return try Response.init(status: .badRequest, json: JSON(node: ["error": error.reason]))
        } catch let error as CustomStringConvertible {
            return try Response.init(status: .badRequest, json: JSON(node: ["error": error.description]))
        } catch let error {
            return try Response.init(status: .badRequest, json: JSON(node: ["error": error]))
        }
    }
}
