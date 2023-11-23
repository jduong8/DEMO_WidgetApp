//
//  QuoteDTO.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 22/11/2023.
//

import Foundation

struct QuoteDTO: Decodable {
    let quote: String?
    let author: String?
    let category: String?
}
