//
//  TasksApp.swift
//  Tasks
//
//  Created by Nathan Krishnan on 6/6/24.
//

import SwiftUI

@main
struct TasksApp: App {
  init() {
    UITabBar.appearance().backgroundColor = UIColor.white
  }
  
  var body: some Scene {
    WindowGroup {
      TaskTabView()
        .environmentObject(TaskItemStore())
    }
  }
}
