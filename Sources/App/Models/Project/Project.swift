import PostgreSQLProvider

final class Project: Model {
    var storage: Storage = Storage()
    
    func makeRow() throws -> Row { return Row() }
    
    init(row: Row) throws {}
}
