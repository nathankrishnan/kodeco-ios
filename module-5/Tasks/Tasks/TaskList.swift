//
//  ContentView.swift
//  Tasks
//
//  Created by Nathan Krishnan on 6/6/24.
//

import SwiftUI

struct TaskList: View {
  @StateObject var taskItemStore = TaskItemStore()

  var body: some View {
    NavigationStack {
      ForEach(taskItemStore.tasks) {
        TaskRow(taskItem: $0)
      }
      Spacer()
      .navigationTitle("My Tasks")
    }
  }
}

#Preview {
  TaskList()
}
