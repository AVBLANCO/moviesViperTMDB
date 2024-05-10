//
//  MoviesApiService.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 4/05/24.
//

import Foundation

class MoviesApiService {
    static let shared = MoviesApiService()
    private let apiKey = "c8553d76f6ad36989c60e55035b740f0"
    private let apiToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjODU1M2Q3NmY2YWQzNjk4OWM2MGU1NTAzNWI3NDBmMCIsInN1YiI6IjY2MzZiMzFkOTU5MGUzMDEyY2JjNDFmNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TU3HN0Lu-l8DBhj8aeXIWEHOiU6gqG_amBV-SwsQQyE"
    private let baseApiURL = "https://api.themoviedb.org/3/movie/top_rated"
    
    func fetchMovies(completion: @escaping (Result<MoviesResponse, Error>) -> Void){
        guard let url = URL(string: baseApiURL) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(apiToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                debugPrint("Error \(error)")
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(APIError.invalideResponse))
                return
            }
            guard let data = data else {
                completion(.failure(APIError.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                debugPrint("## moviesResponse: \(String(describing: response))")
                let moviesResponse = try decoder.decode(MoviesResponse.self, from: data)
                debugPrint("Elementos del Api Services\(moviesResponse.results)")
                completion(.success(moviesResponse))
                // guardado en EntityCore data
            } catch {
                debugPrint("## error: \(error)")
                completion(.failure(error))
            }
            
        }
        task.resume()
        
    }
}

enum APIError: Error {
    case invalidURL
    case invalideResponse
    case invalidData
}
