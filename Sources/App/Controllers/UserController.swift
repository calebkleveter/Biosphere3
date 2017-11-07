import Vapor
import AuthProvider

final class UserController {
    let drop: Droplet
    
    init(drop: Droplet) {
        self.drop = drop
    }
    
    func configureRoutes() {
        // Add public routes to 'user' droplet route group.
        let user = drop.grouped("user")
        user.post("create", handler: create)
        user.post("authenticate", handler: authenticate)
        
        // Add protected routes to protected 'user' droplet route group.
        let protected = user.grouped(JWTMiddleware())
        protected.get("me", handler: me)
    }
    
    func create(_ request: Request)throws -> ResponseRepresentable {
        // Get data from request to create a new user.
        guard let username = request.data["username"]?.string,
              let password = request.data["password"]?.string,
              let email = request.data["email"]?.string else {
                // Data required to create a new user is missing. Return an error.
                return try JSON(node: ["error": "Bad request. Missing required data"])
        }
        do {
            // Created a new user from the request data.
            let user = try User(username: username, email: email, password: password)
            try user.save()
            
            // Create a JWT token for the new user and return it.
            let token = try user.jwt()
            return try JSON(node: ["token": token])
        } catch let error {
            // An error occured while creating the user or their JWT token. Return the error.
            return try JSON(node: ["error": error])
        }
    }
    
    func authenticate(_ request: Request)throws -> ResponseRepresentable {
        // Get the data required for authenticating the user.
        guard let password = request.data["password"]?.string,
              let username = request.data["username"]?.string else {
            // Not all data is present. Abort.
            throw Abort.badRequest
        }
        // Create a set of credentials from the fetched data and attempt to authenticate.
        let credentials: Password = Password(username: username, password: password)
        let user = try User.authenticate(credentials)
        
        // Created a JWT for the user and return it in a JSON response.
        let token = try user.jwt()
        
        return try JSON(node: ["token": token])
    }
    
    func me(_ request: Request)throws -> ResponseRepresentable {
        // Get the request's JWT token.
        let token = request.token
        
        // Get the email and username from the token's payload.
        let email = try token.get(.email)
        let username = try token.get(.username)
        
        // Return the email and username and JSON format.
        return try JSON(node: ["email": email, "username": username])
    }
}
