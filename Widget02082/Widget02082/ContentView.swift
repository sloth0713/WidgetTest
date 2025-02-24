//
//  ContentView.swift
//  Widget02082
//
//  Created by ByteDance on 2025/2/18.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!").onTapGesture {
                WidgetCenter.shared.reloadAllTimelines()
            }
        }
        .padding()
        .onContinueUserActivity("aaa") { userActivity in
            print("userActivity")
        }
        .onOpenURL { url in
            print(url.absoluteString)
            print("url")
        }
    }
}

#Preview {
    ContentView()
}
