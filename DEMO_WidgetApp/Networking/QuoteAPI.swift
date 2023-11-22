//
//  QuoteAPI.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 22/11/2023.
//

import Foundation

final class QuoteAPI {
    private let dataParser = DataParser()
    
    func getQuotesData() -> [Quote] {
        dataParser.load("source.json")
    }
}
