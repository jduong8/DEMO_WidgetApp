//
//  QuoteV4ViewModel.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 23/11/2023.
//

import Foundation

class QuoteV4ViewModel: ObservableObject {
    
    static let shared = QuoteV4ViewModel()
    
    @Published var quotes: [Quote] = []
    var quoteHistory: [Quote] = []
    private let quoteRepository: QuoteRepository

    init(quoteRepository: QuoteRepository = QuoteRepositoryDefault()) {
        self.quoteRepository = quoteRepository
        DispatchQueue.main.async {
            self.getQuotes()
        }
    }
    
    func getQuotes() {
        DispatchQueue.main.async { [self] in
            Task {
                let fetchedQuotes = try await self.quoteRepository.getAllQuotesFromApi()
                self.quotes = fetchedQuotes
                self.addToHistory(quotes: fetchedQuotes)
            }
        }
    }

    private func addToHistory(quotes: [Quote]) {
        for quote in quotes {
            let historyEntry = Quote(quote: quote.quote, author: quote.author, category: quote.category)
            quoteHistory.append(historyEntry)
        }
    }
    
    func selectRequest(for request: QuoteRequest) {
        switch request {
        case .randomQuote:
            getQuotes()
        case .getCount:
            getHistoryCount()
        }
    }

    func getHistoryCount() {
        print(quoteHistory.count)
    }

    static func allRequest() -> [QuoteEntity] {
        return QuoteRequest.allCases.map { request in
            QuoteEntity(
                id: request.rawValue,
                name: request.displayName
            )
        }
    }
}
