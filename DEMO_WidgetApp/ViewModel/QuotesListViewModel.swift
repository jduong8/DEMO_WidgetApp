//
//  QuotesListViewModel.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 22/11/2023.
//

import Foundation

class QuotesListViewModel: ObservableObject {
    var quotes: [Quote] {
        self.getAllQuotes()
    }
    
    private let api: QuoteAPI
    
    init(api: QuoteAPI = .init()) {
        self.api = api
    }
    
    func getAllQuotes() -> [Quote] {
         api.getQuotesData()
    }
}
