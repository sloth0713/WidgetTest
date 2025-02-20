//
//  ContentView.swift
//  Widget02082
//
//  Created by ByteDance on 2025/2/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
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
