//
//  ReduxClassLearningProjectApp.swift
//  ReduxClassLearningProject
//
//  Created by Jacob LeCoq on 3/23/21.
//

import SwiftUI

@main
struct ReduxClassLearningProjectApp: App {
    let store = Store(reducer: appReducer, state: AppState(), middleware: [logMiddleware(), incrementAsyncMiddleware()])
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
