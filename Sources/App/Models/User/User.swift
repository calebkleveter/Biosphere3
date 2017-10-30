import Vapor
import PostgreSQLProvider

final class User: Model {
    let storage: Storage = Storage()
    let username: String
    
    init(username: String) {
        self.username = username
    }
    
    init(row: Row) throws {
        self.username = try row.get("username")
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("username", username)
        return row
    }
}
