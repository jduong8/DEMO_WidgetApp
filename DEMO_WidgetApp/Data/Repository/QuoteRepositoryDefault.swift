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
}
