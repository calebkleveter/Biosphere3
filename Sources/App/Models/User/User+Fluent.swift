import Fluent

extension User {
    var projects: Children<User, Project> {
        return children()
    }
}
