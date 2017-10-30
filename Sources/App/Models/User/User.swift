import Vapor
import PostgreSQLProvider

final class User: Model {
    let storage: Storage = Storage()
    
    init(row: Row) throws {}
    
    func makeRow() throws -> Row {
        let row = Row()
        return row
    }
}
