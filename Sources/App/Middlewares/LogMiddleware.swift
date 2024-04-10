//
//  LogMiddleware.swift
//
//
//  Created by Levon Shaxbazyan on 10.04.24.
//

import Foundation
import Vapor

struct LogMiddleware: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: any AsyncResponder) async throws -> Response {
        print("LOG MIDDLEWARE")
        return try await next.respond(to: request)
    }
}
