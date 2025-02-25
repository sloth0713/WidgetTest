//
//  CatIntentWidget.swift
//  Widget02082
//
//  Created by ByteDance on 2025/2/25.
//


import WidgetKit
import SwiftUI
import Foundation
import AppIntents

struct CatIntentWidgetProvider: AppIntentTimelineProvider {
    typealias Entry = CatIntentWidgetEntry
    
    typealias Intent = CatIntent
    
    func snapshot(for configuration: CatIntent, in context: Context) async -> CatIntentWidgetEntry {
        let entry = CatIntentWidgetEntry(date: Date(), emoji: "mow mow")
        return entry
    }
    
    func timeline(for configuration: CatIntent, in context: Context) async -> Timeline<CatIntentWidgetEntry> {
        var entries: [CatIntentWidgetEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 200 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            let entry = CatIntentWidgetEntry(date: entryDate, emoji: "mow mow")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        return timeline
    }
    

    
    
    func placeholder(in context: Context) -> CatIntentWidgetEntry {
        CatIntentWidgetEntry(date: Date(), emoji: "mow mow")
    }

    func snapshot(for configuration:CatIntent, in context: Context, completion: @escaping (CatIntentWidgetEntry) -> ()) {
        let entry = CatIntentWidgetEntry(date: Date(), emoji: "mow mow")
        completion(entry)
    }

    func timeline(for configuration:CatIntent, in context: Context, completion: @escaping (Timeline<CatIntentWidgetEntry>) -> ()) {
        var entries: [CatIntentWidgetEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 200 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            let entry = CatIntentWidgetEntry(date: entryDate, emoji: "mow mow")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct CatIntentWidgetEntry: TimelineEntry {
    let date: Date
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let currentDate = self.date
        let formattedDate = dateFormatter.string(from: currentDate)
        return formattedDate
    }
    let emoji: String
}

struct CatIntent : WidgetConfigurationIntent{
    static var title: LocalizedStringResource = LocalizedStringResource(stringLiteral: "CatIntent")
    
    func perform() async throws -> some IntentResult {
        print("perform")
        return .result()
    }
}

struct CatIntentWidgetEntryView : View {
    var entry: CatIntentWidgetProvider.Entry

    var body: some View {
        VStack {
            Text(entry.dateString)
            Text("CatIntent mow mow")
        }.widgetURL(URL(string: "iosnews://CatIntentWidgetEntryView"))
    }
}

@available(iOS 17.2, *)
struct CatIntentWidget: Widget {
    let kind: String = "CatIntentWidget"

    var body: some WidgetConfiguration {
            AppIntentConfiguration(kind: kind, intent: CatIntent.self, provider: CatIntentWidgetProvider()) { entry in
                CatIntentWidgetEntryView(entry: entry)
                        .containerBackground(.fill.tertiary, for: .widget)
                    
            }
            .configurationDisplayName("CatIntentWidget")
            
    }
    
}
