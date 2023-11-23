//
//  QuoteAPI.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 22/11/2023.
//

import Foundation

final class QuoteAPI {
    private let dataParser = DataParser()
    
    func getQuotesData() -> [QuoteDTO] {
        dataParser.load("source.json")
    }
    
    func getQuotesAPI() async throws -> [QuoteDTO] {
        return try await dataParser.fetchData(urlString: "https://api.api-ninjas.com/v1/quotes", model: [QuoteDTO].self)
    }
}
