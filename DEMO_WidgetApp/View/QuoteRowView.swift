//
//  QuoteRowView.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 22/11/2023.
//

import SwiftUI

struct QuoteRowView: View {
    
    let quote: Quote
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 2)
                .frame(height: 100)
            VStack(alignment: .leading, spacing: 10) {
                Text(quote.quote)
                    .font(.title3)
                Text("by " + quote.author)
                    .font(.caption2)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    QuoteRowView(quote: .quoteMock)
}
