//
//  QuoteHistory.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 24/11/2023.
//

import SwiftUI

struct QuoteHistory: View {
    
    @ObservedObject var viewmodel: QuoteV4ViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewmodel.quoteHistory, id: \.self) { quote in
                    QuoteRowV4View(quote: quote)
                }
            }
        }
    }
}

#Preview {
    QuoteHistory(viewmodel: .init())
}
