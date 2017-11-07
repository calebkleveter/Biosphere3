import Vapor

extension Droplet {
    func setupRoutes() throws {
        // Register the routes from the custom controllers
        // With the current droplet
        ProjectController(drop: self).configureRoutes()
        UserController(drop: self).configureRoutes()
        JWTController(drop: self).configureRoutes()
    }
}
