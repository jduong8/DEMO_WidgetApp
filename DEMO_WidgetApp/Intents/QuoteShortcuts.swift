//
//  QuoteShortcuts.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 20/12/2023.
//

import AppIntents

struct QuoteShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: QuoteIntent(),
            phrases: [
            "Add request",
            "Start \(.applicationName)",
            "Start a \(\.$quoteRequest) with \(.applicationName)"
            ]
        )
    }
}
