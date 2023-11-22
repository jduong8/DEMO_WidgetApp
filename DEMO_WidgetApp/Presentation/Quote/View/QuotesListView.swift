//
//  QuotesListView.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 22/11/2023.
//

import SwiftUI

struct QuotesListView: View {

    @StateObject private var viewmodel = QuotesListViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(viewmodel.quotes, id: \.self) { quote in
                    QuoteRowView(quote: quote)
                }
            }
            .padding()
        }
    }
}

#Preview {
    QuotesListView()
}
