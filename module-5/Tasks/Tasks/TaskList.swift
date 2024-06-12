//
//  ContentView.swift
//  Tasks
//
//  Created by Nathan Krishnan on 6/6/24.
//

import SwiftUI

struct TaskList: View {
  @EnvironmentObject var taskItemStore: TaskItemStore

  var body: some View {
    NavigationStack {
      ForEach(taskItemStore.tasks) {
        TaskRow(taskItem: $0)
      }
      Spacer()
      HStack {
        NewTaskButton()
        Spacer()
      }
      .padding(.leading, 20)
      .navigationTitle("My Tasks")
    }
  }
}

struct NewTaskButton: View {
  var body: some View {
    Button(action: {
      // TODO
    }) {
      HStack {
        Image(systemName: "plus.circle.fill")
        Text("New Task")
          .fontWeight(.bold)
      }
    }
  }
}

#Preview {
  TaskList()
    .environmentObject(TaskItemStore())
}
