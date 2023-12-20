//
//  QuoteEntity.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 20/12/2023.
//

import AppIntents

struct QuoteEntity: AppEntity {
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Quote"

    let id: Int
    let name: String

    var displayRepresentation: DisplayRepresentation {
      DisplayRepresentation(
        title: LocalizedStringResource(
          stringLiteral: name
        )
      )
    }
    
    var quoteRequest: QuoteRequest {
        guard let request = QuoteRequest(rawValue: id) else {
            return .randomQuote
        }
        return request
    }
    
    static var defaultQuery = QuoteQuery()
}
