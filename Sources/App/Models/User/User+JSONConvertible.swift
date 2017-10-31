import JSON

extension User: JSONConvertible {
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("username", username)
        return json
    }
    
    convenience init(json: JSON) throws {
        let username: String = try json.get("username")
        let password: String = try json.get("password")
        let email: String = try json.get("email")
        try self.init(username: username, email: email, password: password)
    }
}
