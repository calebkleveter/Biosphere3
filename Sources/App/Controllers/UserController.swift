import Vapor

final class UserController {
    let drop: Droplet
    
    init(drop: Droplet) {
        self.drop = drop
    }
    
    func configureRoutes() {
        let user = drop.grouped("user")
        user.post("create", handler: createUser)
    }
    
    func createUser(_ request: Request)throws -> ResponseRepresentable {
        guard let username = request.data["username"]?.string,
              let password = request.data["password"]?.string,
              let email = request.data["email"]?.string else {
                return try JSON(node: ["error", "Bad request. Missing required data"])
        }
        do {
            let user = try User(username: username, email: email, password: password)
            try user.save()
            let token = try user.jwt()
            return try JSON(node: ["token", token])
        } catch let error {
            return try JSON(node: ["error": error])
        }
    }
}