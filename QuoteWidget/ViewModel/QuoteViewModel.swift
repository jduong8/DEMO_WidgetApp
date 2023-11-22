//
//  QuoteViewModel.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 22/11/2023.
//

import Foundation

class QuoteViewModel: ObservableObject {
    
    var quote: Quote {
        self.getOneQuote()
    }
    
    private let api: QuoteAPI
    
    init(api: QuoteAPI = .init()) {
        self.api = api
    }
    
    func getOneQuote() -> Quote {
        let dayOfWeek = Calendar.current.component(.weekday, from: Date())
        let quotes = api.getQuotesData()
        
        guard quotes.count == 7 else {
            return Quote(quote: "", author: "")
        }
        
        let index = (dayOfWeek - 1)
        let result = quotes[index]
        return result
    }
}
