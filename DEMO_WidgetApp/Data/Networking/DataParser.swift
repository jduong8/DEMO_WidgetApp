//
//  DataParser.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 22/11/2023.
//

import Foundation

class DataParser {
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
    func fetchData<T: Decodable>(
        urlString: String,
        model: T.Type
    ) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidPath
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("MYkSzQvmYbsPfSn8UinrOg==RiuuxYAiEF5LbJCO", forHTTPHeaderField: "X-Api-Key")
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw APIError.decoding
        }
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(T.self, from: data)
        
        return decoded        
    }
}
