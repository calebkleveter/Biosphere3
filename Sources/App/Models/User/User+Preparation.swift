import PostgreSQLProvider

extension User: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self, closure: { (user) in
            user.id()
            user.string("username")
            user.string("email")
            user.string("password")
        })
    }
    
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}
