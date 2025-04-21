//
//  NewsService.swift
//  Moment
//
//  Created by Connor Ruesch on 4/21/25.
//

import Foundation

class NewsService {
    static func fetchNews() async throws -> NewsResponse {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&pageSize=1&apiKey=\(Variables.apiKey)")
        
        guard let url = url else {
            fatalError("Invalid URL")
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(NewsResponse.self, from: data)
            return response
        } catch {
            print("Error: \(error)")
            throw error
        }
    }
    
}
