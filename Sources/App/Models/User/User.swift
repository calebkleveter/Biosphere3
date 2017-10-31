import PostgreSQLProvider

final class User: Model {
    static let hasher = BCryptHasher(cost: 10)
    
    let storage: Storage = Storage()
    let username: String
    let email: String
    let password: String
    
    init(username: String, email: String, password: String)throws {
        let passwordBytes = password.makeBytes()
        
        self.username = username
        self.email = email
        self.password = try User.hasher.make(passwordBytes).makeString()
    }
    
    init(row: Row) throws {
        let passwordBytes = try (row.get("password") as String).makeBytes()
        
        self.username = try row.get("username")
        self.email = try row.get("email")
        self.password = try User.hasher.make(passwordBytes).makeString()
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("username", username)
        try row.set("email", email)
        try row.set("password", password)
        return row
    }
}
