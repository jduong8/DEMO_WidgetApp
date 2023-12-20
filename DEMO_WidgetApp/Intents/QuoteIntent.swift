//
//  QuoteIntent.swift
//  DEMO_WidgetApp
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
