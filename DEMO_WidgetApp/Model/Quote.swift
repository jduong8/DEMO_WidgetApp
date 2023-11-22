//
//  Quote.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 22/11/2023.
//

import Foundation

struct Quote: Hashable, Decodable {
    let quote: String
    let author: String
}

extension Quote {
    static var quoteMock: Quote {
        .init(
            quote: "This is a test",
            author: "Dev-iJoe"
        )
    }
    static var quotesMock: [Quote] {
        [
            .init(
                quote: "Test001",
                author: "user1"
            ),
            .init(
                quote: "Test002",
                author: "user2"
            )
        ]
    }
}
