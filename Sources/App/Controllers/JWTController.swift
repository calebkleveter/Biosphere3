import Vapor
import JWT

final class JWTController {
    let drop: Droplet
    
    init(drop: Droplet) {
        self.drop = drop
    }
    
    func configureRoutes() {
        let token = drop.grouped("token")
        token.get("verify", handler: verfiy)
    }
    
    func verfiy(_ request: Request)throws -> ResponseRepresentable {
        guard let jwt = request.headers["Authorization"]?.string else {
            return try JSON(node: ["error": "Bad request. Missing required header"])
        }
        let verified = jwt.canVerifySigniture(withSigner: JWTConfig.signerKey)
        return try JSON(node: ["verified": verified])
    }
}
