//
//  TaskTabView.swift
//  Tasks
//
//  Created by Nathan Krishnan on 8/11/24.
//

import SwiftUI

struct TaskTabView: View {
  var body: some View {
    TabView {
      TaskList()
        .tabItem {
          Image(systemName: "list.bullet.circle")
          Text("Pending")
        }
      TaskList(filterByTaskItemStatus: .completed)
        .tabItem {
          Image(systemName: "checkmark.circle")
          Text("Completed")
        }
    }
  }
}

#Preview {
  TaskTabView()
    .environmentObject(TaskItemStore())
}
