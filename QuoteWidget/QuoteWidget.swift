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
        SimpleEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

struct QuoteWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            colorForDayOfWeek(entry.date)
                .ignoresSafeArea()
            VStack {
                Text("Time:")
                Text(entry.date, style: .time)
                
                Text("Emoji:")
                Text(entry.emoji)
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
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
