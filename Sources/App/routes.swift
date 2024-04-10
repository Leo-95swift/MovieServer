import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    // create a movie
    app.post("movies") { req async throws in
        let movie = try req.content.decode(Movie.self)
        try await movie.save(on: req.db)
        return movie
    }
    
    // get all movies
    app.get("movies") { req async throws in
        try await Movie.query(on: req.db)
            .all()
    }
    
    // get movie by id
    app.get("movies", ":id") { req async throws in
        guard let movie = try await Movie.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.badRequest)
        }
        
        return movie
    }
    
    // delete movie
    app.delete("movies", ":id") { req async throws in
        guard let movie = try await Movie.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.badRequest)
        }
        
        try await movie.delete(on: req.db)
        return movie
    }
    
    // update a movie
    app.put("movies") { req async throws in
        
        let movie = try req.content.decode(Movie.self)
        
        guard let movieToUpdate = try await Movie.find(movie.id, on: req.db) else {
            throw Abort(.badRequest)
        }
        
        movieToUpdate.title = movie.title
        
        try await movieToUpdate.update(on: req.db)
        return movieToUpdate
    }

    try app.register(collection: TodoController())
}
