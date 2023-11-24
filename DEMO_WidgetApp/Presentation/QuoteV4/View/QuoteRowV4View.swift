//
//  QuoteRowV4View.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 24/11/2023.
//

import SwiftUI

struct QuoteRowV4View: View {

    let quote: Quote
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(quote.category?.uppercased() ?? "No category")
                .font(.largeTitle)
                .padding()
            Text(quote.quote)
                .font(.title3)
            Text("by " + quote.author)
                .font(.caption2)
        }
        .padding(.horizontal)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 2)
        }
    }
}

#Preview {
    QuoteRowV4View(quote: .quoteMock)
}
