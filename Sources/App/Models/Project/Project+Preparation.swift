import Fluent

extension Project: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self, closure: { (project) in
            project.id()
        })
    }
    
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}
