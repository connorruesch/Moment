//
//  NewsService.swift
//  Moment
//
//  Created by Connor Ruesch on 4/21/25.
//

import Foundation

class NewsService {
    static func fetchNews() async throws -> NewsResponse {
        let components = URLComponents(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(Variables.apiKey)")
        
        guard let url = components?.url else { fatalError("Invalid URL") }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(NewsResponse.self, from: data)
        
        return response
    }
    
    static func printJson() async throws {
        let components = URLComponents(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(Variables.apiKey)")
        
        guard let url = components?.url else { fatalError("Invalid URL") }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        print(String(bytes: data, encoding: String.Encoding.utf8) ?? "")
    }
}
