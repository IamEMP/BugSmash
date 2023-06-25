//
//  BugSmashApp.swift
//  BugSmash
//
//  Created by Ethan Phillips on 5/8/23.
//

import SwiftUI

@main
struct BugSmashApp: App {
    @StateObject var dataController = DataController()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarView()
            } content: {
                ContentView()
            } detail: {
                DetailView()
            }
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
                .onChange(of: scenePhase) { phase in
                    if phase != .active {
                        dataController.save()
                    }
                }
        }
    }
}
