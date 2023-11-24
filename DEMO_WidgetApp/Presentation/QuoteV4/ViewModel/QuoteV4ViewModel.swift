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
    
    private let quoteRepository: QuoteRepository

    init(quoteRepository: QuoteRepository = QuoteRepositoryDefault()) {
        self.quoteRepository = quoteRepository
        getQuotes()
    }
    
    func getQuotes() {
        Task {
            self.quotes = try await quoteRepository.getAllQuotesFromApi()
        }
    }
}
