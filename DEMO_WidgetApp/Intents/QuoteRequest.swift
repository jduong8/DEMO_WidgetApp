//
//  QuoteRequest.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 20/12/2023.
//

import Foundation

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
