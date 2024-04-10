import NIOSSL
import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(
        .postgres(
            hostname: "rain.db.elephantsql.com",
            username: "xargvacp",
            password: "7z8g-KrmXO4PnFDnkbLCs7GZbYYaxLPI",
            database: "xargvacp"), 
        as: .psql
    )

    // register migration
    app.migrations.add(CreateMoviesTableMigration())
    app.views.use(.leaf)

    // register routes
    try routes(app)
}
