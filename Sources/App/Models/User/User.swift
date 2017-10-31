import PostgreSQLProvider

final class User: Model {
    let storage: Storage = Storage()
    let username: String
    let email: String
    let password: String
    
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
    }
    
    init(row: Row) throws {
        self.username = try row.get("username")
        self.email = try row.get("email")
        self.password = try row.get("password")
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("username", username)
        try row.set("email", email)
        try row.set("password", password)
        return row
    }
}
