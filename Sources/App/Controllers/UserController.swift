import Vapor

final class UserController {
    let drop: Droplet
    
    init(drop: Droplet) {
        self.drop = drop
    }
    
    func configureRoutes() {
        let user = drop.grouped("user")
        user.post("create", handler: create)
        
        let protected = user.grouped(JWTMiddleware())
        protected.get("me", handler: me)
    }
    
    func create(_ request: Request)throws -> ResponseRepresentable {
        guard let username = request.data["username"]?.string,
              let password = request.data["password"]?.string,
              let email = request.data["email"]?.string else {
                return try JSON(node: ["error": "Bad request. Missing required data"])
        }
        do {
            let user = try User(username: username, email: email, password: password)
            try user.save()
            let token = try user.jwt()
            return try JSON(node: ["token": token])
        } catch let error {
            return try JSON(node: ["error": error])
        }
    }
    
    func me(_ request: Request)throws -> ResponseRepresentable {
        let token = request.token
        let email = try token.get(.email)
        return try JSON(node: ["email": email])
    }
}
