import Vapor

extension Request {
    func user()throws -> User {
        guard let tokenId = try self.token.get(.id).float else {
            throw Abort.missingRequestData
        }
        let id: Identifier = Identifier.number(.int(Int(tokenId)))
        guard let user = try User.find(id) else {
            throw Abort.badUserID
        }
        return user
    }
}
