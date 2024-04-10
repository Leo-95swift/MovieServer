//
//  CreateMoviesTableMigration.swift
//
//
//  Created by Levon Shaxbazyan on 10.04.24.
//

import Foundation
import Fluent

struct CreateMoviesTableMigration: AsyncMigration {

    func prepare(on database: any Database) async throws {
        try await database.schema("movies")
            .id()
            .field("title", .string, .required)
            .create()
    }

    func revert(on database: any Database) async throws {
        try await database.schema("movies")
            .delete()
    }
}
