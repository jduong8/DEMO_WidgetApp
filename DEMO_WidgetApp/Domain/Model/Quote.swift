//
//  Quote.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 22/11/2023.
//

import Foundation

struct Quote: Hashable {
    let quote: String
    let author: String
    let category: String?
}
extension Quote {
    static var quoteMock: Quote {
        .init(
            quote: "This is a test",
            author: "Dev-iJoe",
            category: nil
        )
    }
    static var quotesMock: [Quote] {
        [
            .init(
                quote: "Test001",
                author: "user1",
                category: nil
            ),
            .init(
                quote: "Test002",
                author: "user2",
                category: nil
            )
        ]
    }
}
