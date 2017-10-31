import PostgreSQLProvider

extension User: RowRepresentable {
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("username", username)
        try row.set("email", email)
        try row.set("password", password)
        return row
    }
}
