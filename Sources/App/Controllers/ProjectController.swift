import Vapor

final class ProjectController {
    let drop: Droplet
    
    init(drop: Droplet) {
        self.drop = drop
    }
    
    func configureRoutes() {
        // Add controller routes to `project` droplet route group.
        let project = drop.grouped("project").grouped(APIErrorMiddleware())
    }
}
