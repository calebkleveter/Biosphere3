import FluentProvider

final class Project: Model {
    let storage: Storage = Storage()
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    init(row: Row) throws {
        self.name = try row.get("name")
    }
}
