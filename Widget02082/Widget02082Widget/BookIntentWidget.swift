//
//  BookIntentWidget.swift
//  Widget02082
//
//  Created by ByteDance on 2025/2/20.
//

import WidgetKit
import SwiftUI
import Foundation

struct BookIntentWidgetProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> BookIntentWidgetEntry {
        BookIntentWidgetEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(for configuration:ReadIntent, in context: Context, completion: @escaping (BookIntentWidgetEntry) -> ()) {
        let entry = BookIntentWidgetEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(for configuration:ReadIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [BookIntentWidgetEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 200 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            let entry = BookIntentWidgetEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct BookIntentWidgetEntry: TimelineEntry {
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

struct BookIntentWidgetEntryView : View {
    var entry: BookIntentWidgetProvider.Entry

    var body: some View {
        VStack {
            Text(entry.dateString)
            Text("BookIntentWidgetEntryView")
        }.widgetURL(URL(string: "iosnews://BookIntentWidgetEntryView"))
    }
}

struct BookIntentWidget: Widget {
    let kind: String = "BookIntentWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ReadIntent.self, provider: BookIntentWidgetProvider()) { entry in
            if #available(iOS 17.0, *) {
                BookIntentWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
                    
            } else {
                BookIntentWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("BookIntentWidget")
        .description("This is an example BookIntentWidget.")
    }
    
//    var supportedFamilies: [WidgetFamily] {
//        
//        let randomDouble = Double.random(in: 0.0..<1.0)
//        if (randomDouble > 0.5){
//            return [.systemSmall]
//        }else {
//            return []
//        }
//    
//    }
}
