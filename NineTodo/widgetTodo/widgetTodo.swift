//
//  widgetTodo.swift
//  widgetTodo
//
//  Created by Doyeon on 2023/06/24.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), todos: [
            ToDoItem(title: "빨래하기", description: "빨래해라 비비야", isDone: false),
            ToDoItem(title: "청소하기", description: "청소해라 비비야", isDone: false)], configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let todoManager = TodoManager()
        let entry = SimpleEntry(date: Date(), todos: todoManager.todos, configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, todos: [
                ToDoItem(title: "빨래하기", description: "빨래해라 비비야", isDone: false),
                ToDoItem(title: "청소하기", description: "청소해라 비비야", isDone: false)], configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let todos: [ToDoItem]
    let configuration: ConfigurationIntent
}

struct widgetTodoEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        VStack {
            Text("Todo Items")
                .font(.title)
            ForEach(entry.todos, id: \.self) { todo in
                Text(todo.title)
            }
        }
    }
}

struct widgetTodo: Widget {
    let kind: String = "widgetTodo"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            widgetTodoEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct widgetTodo_Previews: PreviewProvider {
    static var previews: some View {
        widgetTodoEntryView(entry: SimpleEntry(date: Date(), todos: [
            ToDoItem(title: "빨래하기", description: "빨래해라 비비야", isDone: false),
            ToDoItem(title: "청소하기", description: "청소해라 비비야", isDone: false)], configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
