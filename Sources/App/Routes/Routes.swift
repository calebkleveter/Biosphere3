import Vapor

extension Droplet {
    func setupRoutes() throws {
        UserController(drop: self).configureRoutes()
    }
}
