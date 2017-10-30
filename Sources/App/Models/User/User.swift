import Vapor
import PostgreSQLProvider

final class User: Model {
    var storage: Storage = Storage()
    
    init(row: Row) throws {}
    
    func makeRow() throws -> Row {
        let row = Row()
        return row
    }
}
