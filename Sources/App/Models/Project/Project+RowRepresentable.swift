import Fluent

extension Project: RowRepresentable {
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("name", name)
        try row.set(User.foreignIdKey, userID)
        return row
    }
}
