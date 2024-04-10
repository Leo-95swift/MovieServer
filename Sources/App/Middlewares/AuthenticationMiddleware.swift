//
//  AuthenticationMiddleware.swift
//
//
//  Created by Levon Shaxbazyan on 10.04.24.
//

import Foundation
import Vapor

struct AuthenticationMiddleware: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: any AsyncResponder) async throws -> Response {

        guard let authorization = request.headers.bearerAuthorization else {
            throw Abort(.unauthorized)
        }

        print(authorization.token)
        return try await next.respond(to: request)
    }
}
