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
        self.username = try row.get("username")
        self.email = try row.get("email")
        self.password = try row.get("password")
    }
}
