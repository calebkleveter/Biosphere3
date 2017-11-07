import Fluent

extension Project {
    var user: Parent<Project, User> {
        return parent(id: userID)
    }
}
