//
//  QuoteRepositoryDefault.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 22/11/2023.
//

import Foundation

class QuoteRepositoryDefault: QuoteRepository {

    private let api: QuoteAPI
    
    init(api: QuoteAPI = .init()) {
        self.api = api
    }
    
    func getAllQuotes() -> [Quote] {
        return api.getQuotesData().map { Quote(with: $0) }
    }
    
    func getOneQuote() -> Quote {
        let dayOfWeek = Calendar.current.component(.weekday, from: Date())
        let quotes = api.getQuotesData()
        
        guard quotes.count == 7 else {
            return Quote(quote: "", author: "")
        }
        
        let index = (dayOfWeek + 5) % 7 // Pour commencer par lundi
        let quoteData = quotes[index]
        return Quote(with: quoteData)
    }
}
