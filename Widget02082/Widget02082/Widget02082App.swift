//
//  Widget02082App.swift
//  Widget02082
//
//  Created by ByteDance on 2025/2/18.
//

import SwiftUI

import CoreSpotlight
import AppIntents
import Intents

@main
struct Widget02082App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView().onAppear {
//                donateRelevantSuggestion()
                donateIntentSuggestion()
            }
        }
    }
    
    private func donateIntentSuggestion() {
        
        let intent:ReadIntent = ReadIntent()
        intent.book = "xiyouji"
        intent.author = "wce"
        intent.suggestedInvocationPhrase = "(・∀・)"
        let interaction:INInteraction = INInteraction(intent: intent, response: nil)
        interaction.donate { error in
            if let error = error {
                print (error)
            }else {
                print("success")
            }
        }
        
    }
    
    private func donateRelevantSuggestion() {
        var relevantShortcuts: [INRelevantShortcut] = []

        let activity = NSUserActivity(activityType: "aaa")
        print(activity.expirationDate)
        let shortcut = INShortcut(userActivity: activity)
            let relevantShortcut = INRelevantShortcut(shortcut: shortcut)
            relevantShortcut.shortcutRole = .information
            relevantShortcut.widgetKind = "Widget02082Widget"

            let dateProvider = INDateRelevanceProvider(start: Date(),
                                                       end: Date(timeIntervalSinceNow: 18))
            relevantShortcut.relevanceProviders = [dateProvider]
            
            relevantShortcuts.append(relevantShortcut)
//        }

        INRelevantShortcutStore.default.setRelevantShortcuts(relevantShortcuts) { (error) in
            if let error = error {
                print("Failed to set relevant shortcuts. \(error))")
            } else {
                print("Relevant shortcuts set.")
            }
        }
    }
    
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }


    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
//        print(userActivity.activityType)
//        print("continue userActivity")

        return true
    }
    
    func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
//        print(userActivityType)
//        print("willContinueUserActivityWithType")
        return true
    }
    
    func application(_ application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: any Error) {
        print(userActivityType)
        print("didFailToContinueUserActivityWithType")
    }
    
    func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {
        print(userActivity.activityType)
        if let info = userActivity.userInfo?["LockExtensionInfo"] {
            print(info)
        }
    }
}
