import Vapor
import PostgreSQLProvider

final class User: Model {
    let storage: Storage = Storage()
    let username: String
    let email: String
    
    init(username: String, email: String) {
        self.username = username
        self.email = email
    }
    
    init(row: Row) throws {
        self.username = try row.get("username")
        self.email = try row.get("email")
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("username", username)
        try row.set("email", email)
        return row
    }
}
