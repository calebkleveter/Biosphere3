import Vapor

final class UserController {
    let drop: Droplet
    
    init(drop: Droplet) {
        self.drop = drop
    }
}
