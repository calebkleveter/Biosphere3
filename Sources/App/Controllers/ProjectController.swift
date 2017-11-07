import Vapor

final class ProjectController {
    let drop: Droplet
    
    init(drop: Droplet) {
        self.drop = drop
    }
}
