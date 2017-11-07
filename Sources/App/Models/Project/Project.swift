import FluentProvider

final class Project: Model {
    let storage: Storage = Storage()
    
    let name: String
    let userID: Identifier?
    
    init(name: String, user: User) {
        self.name = name
        self.userID = user.id
    }
    
    init(row: Row) throws {
        self.name = try row.get("name")
        self.userID = try row.get(User.foreignIdKey)
    }
}
