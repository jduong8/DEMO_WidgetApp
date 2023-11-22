//
//  QuoteViewModel.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 22/11/2023.
//

import Foundation

class QuoteViewModel: ObservableObject {

    private let quoteRepository: QuoteRepository
    
    var quote: Quote {
        quoteRepository.getOneQuote()
    }
    
    init(quoteRepository: QuoteRepository = QuoteRepositoryDefault()) {
        self.quoteRepository = quoteRepository
    }
}
