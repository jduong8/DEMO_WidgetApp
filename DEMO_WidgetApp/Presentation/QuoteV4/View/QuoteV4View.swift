//
//  QuoteV4View.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 23/11/2023.
//

import SwiftUI

struct QuoteV4View: View {
    
    @StateObject private var viewmodel = QuoteV4ViewModel.shared
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(viewmodel.quotes, id: \.self) { quote in
                    QuoteRowV4View(quote: quote)
                }.onAppear {
                    Task {
                        viewmodel.getQuotes
                    }
                }
                
                NavigationLink("Look history") {
                    QuoteHistory(viewmodel: viewmodel)
                }
                
                Button {
                    viewmodel.getQuotes()
                } label: {
                    HStack {
                        Text("Reload")
                        Image(systemName: "repeat.circle.fill")
                    }
                    .foregroundStyle(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.blue)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    QuoteV4View()
}
