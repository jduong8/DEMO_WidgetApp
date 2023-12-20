//
//  MasterView.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 24/11/2023.
//

import SwiftUI

struct MasterView: View {
    
    init() {
        QuoteShortcuts.updateAppShortcutParameters()
    }
    
    var body: some View {
        TabView {
            QuotesListView()
                .tabItem {
                    Label("Local", systemImage: "house")
                }
            
            QuoteV4View()
                .tabItem {
                    Label("API", systemImage: "network")
                }
        }
    }
}
