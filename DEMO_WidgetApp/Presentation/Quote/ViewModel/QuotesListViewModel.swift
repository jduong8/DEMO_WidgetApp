//
//  QuotesListViewModel.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 22/11/2023.
//

import Foundation

class QuotesListViewModel: ObservableObject {
    private let quoteRepository: QuoteRepository
    
    var quotes: [Quote] {
        return quoteRepository.getAllQuotes()
    }
    
    init(quoteRepository: QuoteRepository = QuoteRepositoryDefault()) {
        self.quoteRepository = quoteRepository
    }
}
