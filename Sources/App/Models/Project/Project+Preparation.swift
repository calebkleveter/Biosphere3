import Fluent

extension Project: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self, closure: { (project) in
            project.id()
            project.string("name")
            project.parent(User.self)
        })
    }
    
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}
