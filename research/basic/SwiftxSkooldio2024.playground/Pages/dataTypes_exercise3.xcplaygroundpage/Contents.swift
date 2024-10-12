//: [Previous](@previous)

import Foundation

// Step 1: Define the Genre enum
enum Genre {
    case action, comedy, drama, sciFi
}

// Step 2: Define the Movie struct
struct Movie {
    var title: String
    var genre: Genre
    var rating: Double
}

// Step 3: Define the MovieManager class
class MovieManager {
    var movies: [Movie] = []

    // Method to search for a movie by title
    func searchMovie(byTitle title: String) -> (movie: Movie?, message: String) {
        if let foundMovie = movies.first(where: { $0.title.lowercased() == title.lowercased() }) {
            return (foundMovie, "Movie found: \(foundMovie.title)!")
        } else {
            return (nil, "Movie not found.")
        }
    }
}

// Testing
let movie1 = Movie(title: "Inception", genre: .sciFi, rating: 8.8)
let movie2 = Movie(title: "The Dark Knight", genre: .action, rating: 9.0)
let movie3 = Movie(title: "Forrest Gump", genre: .drama, rating: 8.8)

let manager = MovieManager()
manager.movies.append(movie1)
manager.movies.append(movie2)
manager.movies.append(movie3)

// Searching for a movie
let searchResult = manager.searchMovie(byTitle: "Forrest Gump")
print(searchResult.message)

// Example Output: "Movie found: Forrest Gump!"

