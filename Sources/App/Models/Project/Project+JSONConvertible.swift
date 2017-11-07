import Vapor

extension Project: JSONConvertible {
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("name", self.name)
        return json
    }
    
    convenience init(json: JSON) throws {
        let userID: Identifier = try json.get("user_id")
        let name: String = try json.get("name")
        guard let user = try User.find(userID) else {
            throw Abort(.badRequest, reason: "Unable to find user for ID")
        }
        self.init(name: name, user: user)
    }
}
