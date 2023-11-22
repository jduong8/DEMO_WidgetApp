//
//  QuoteRepository.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 22/11/2023.
//

import Foundation

protocol QuoteRepository {
    func getAllQuotes() -> [Quote]
    func getOneQuote() -> Quote
}
