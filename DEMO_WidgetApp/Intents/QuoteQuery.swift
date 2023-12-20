//
//  QuoteQuery.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 20/12/2023.
//

import AppIntents

struct QuoteQuery: EntityQuery {
    func entities(for identifiers: [Int]) async throws -> [QuoteEntity] {
        let requests = QuoteV4ViewModel.allRequest().filter { request in
        return identifiers.contains(request.id)
        }
        return requests
    }
    func suggestedEntities() async throws -> [QuoteEntity] {
        QuoteV4ViewModel.allRequest()
    }
}
