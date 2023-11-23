//
//  QuoteWidget.swift
//  QuoteWidget
//
//  Created by Jonathan Duong on 22/11/2023.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), quote: Quote.quoteMock)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), quote: Quote.quoteMock)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = SimpleEntry(date: Date(), quote: QuoteViewModel().quote)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }

}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let quote: Quote
}

struct QuoteWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            colorForDayOfWeek(entry.date)
                .ignoresSafeArea()
            VStack {
                Text(entry.quote.quote)
                    .font(.footnote)
                    .lineLimit(5, reservesSpace: false)
                    .multilineTextAlignment(.center)

                Text("by \(entry.quote.author)")
                    .font(.caption2)
                    .padding()
            }
        }
    }
    
    func colorForDayOfWeek(_ date: Date) -> Color {
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: date)

        switch dayOfWeek {
        case 1: return .red // Dimanche
        case 2: return .blue // Lundi
        case 3: return .green // Mardi
        case 4: return .yellow // Mercredi
        case 5: return .orange // Jeudi
        case 6: return .purple // Vendredi
        case 7: return .pink // Samedi
        default: return .white
        }
    }
}

struct QuoteWidget: Widget {
    let kind: String = "QuoteWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                QuoteWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                QuoteWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    QuoteWidget()
} timeline: {
    SimpleEntry(date: .now, quote: .quoteMock)
    SimpleEntry(date: .now, quote: .init(quote: "🤯", author: "Me", category: "test"))
}
