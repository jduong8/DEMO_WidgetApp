//
//  Quote+Mappers.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 22/11/2023.
//

import Foundation

extension Quote {
    init(with dto: QuoteDTO) {
        self.quote = dto.quote ?? "No quote provided"
        self.author = dto.author ?? "Unknown Author"
    }
}
