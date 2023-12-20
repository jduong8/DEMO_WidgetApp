//
//  QuoteIntent.swift
//  QuoteIntent
//
//  Created by Jonathan Duong on 20/12/2023.
//

import AppIntents

struct QuoteIntent: AppIntent {

    @Parameter(title: "Request")
    var quoteRequest: QuoteEntity?

    static var title: LocalizedStringResource = "Add a quote"
    
    func perform() async throws -> some ProvidesDialog {
        let viewModel =  QuoteV4ViewModel.shared
        let entity: QuoteEntity
        
        if let request = self.quoteRequest {
            viewModel.selectRequest(for: request.quoteRequest)
            entity = request
        } else {
            let request = try await $quoteRequest.requestDisambiguation(
                among: QuoteV4ViewModel.allRequest(),
                dialog: IntentDialog("Select a request")
            )
            entity = request
            viewModel.selectRequest(for: request.quoteRequest)
        }
        
        return .result(dialog: "\(entity.quoteRequest.rawValue)")
    }
}

struct QuoteShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: QuoteIntent(),
            phrases: [
            "Add request",
            "Start \(.applicationName)",
            "Start a \(\.$quoteRequest) with \(.applicationName)"
            ]
        )
    }
}

// MARK: - Implement Done
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

// MARK: - Implement Done
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

// MARK: - Implement Done

enum QuoteRequest: Int, CaseIterable {
    case randomQuote = 1
    case getCount = 2
    
    var displayName: String {
        switch self {
        case .randomQuote:
            return "Get random quote"
        case .getCount:
            return "Get count"
        }
    }
}
