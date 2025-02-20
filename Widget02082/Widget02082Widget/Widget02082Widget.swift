//
//  Widget02082Widget.swift
//  Widget02082Widget
//
//  Created by ByteDance on 2025/2/18.
//

import WidgetKit
import SwiftUI
import Foundation

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
        for hourOffset in 0 ..< 200 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀", relevance: TimelineEntryRelevance(score: 100, duration: 20))
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let currentDate = self.date
        let formattedDate = dateFormatter.string(from: currentDate)
        return formattedDate
    }
    let emoji: String
    var relevance: TimelineEntryRelevance?
}

struct Widget02082WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            
            
            Text(entry.dateString)

            Text("Emoji:")
            Text(entry.emoji)
        }.widgetURL(URL(string: "iosnews://iosNews.com/p1=1&p2=2"))
    }
}

struct Widget02082Widget: Widget {
    let kind: String = "Widget02082Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                Widget02082WidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
                    
            } else {
                Widget02082WidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        
//        .supportedFamilies([WidgetFamily.systemMedium])
    
        
    }
    var supportedFamilies: [WidgetFamily] {
        
        let randomDouble = Double.random(in: 0.0..<1.0)
        if (randomDouble > 0.5){
            return [.systemSmall]
        }else {
            return []
        }
    
    }
}

//#Preview(as: .systemSmall) {
//    Widget02082Widget()
//} timeline: {
//    SimpleEntry(date: .now, emoji: "😀")
//    SimpleEntry(date: .now, emoji: "🤩")
//}
