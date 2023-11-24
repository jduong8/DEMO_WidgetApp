//
//  QuoteV4ViewModel.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 23/11/2023.
//

import Foundation

@MainActor
class QuoteV4ViewModel: ObservableObject {
    
    @Published var quotes: [Quote] = []
    @Published var quoteHistory: [Quote] = []

    private let quoteRepository: QuoteRepository

    init(quoteRepository: QuoteRepository = QuoteRepositoryDefault()) {
        self.quoteRepository = quoteRepository
        getQuotes()
    }
    
    func getQuotes() {
        Task {
            let fetchedQuotes = try await quoteRepository.getAllQuotesFromApi()
            self.quotes = fetchedQuotes
            addToHistory(quotes: fetchedQuotes)
        }
    }

    private func addToHistory(quotes: [Quote]) {
        for quote in quotes {
            let historyEntry = Quote(quote: quote.quote, author: quote.author, category: quote.category)
            quoteHistory.append(historyEntry)
        }
    }
}
