import Vapor

final class JWTController {
    let drop: Droplet
    
    init(drop: Droplet) {
        self.drop = drop
    }
}
