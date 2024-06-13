//
//  TaskRow.swift
//  Tasks
//
//  Created by Nathan Krishnan on 6/9/24.
//

import SwiftUI

struct TaskRow: View {
  @EnvironmentObject var taskItemStore: TaskItemStore
  let taskItem: TaskItem

  var body: some View {
    VStack() {
      HStack {
        Text(taskItem.title)
          .font(.title3)
          .fontWeight(.semibold)
          .foregroundColor(Color.blue)
        Spacer()
        Button(action: {
          taskItemStore.toggleStatus(for: taskItem)
        }) {
          Image(systemName: taskItem.isCompleted ? "checkmark.square" : "square")
            .foregroundStyle(taskItem.isCompleted ? .green : .red)
            .font(.system(size: 20, weight: .bold))
        }
      }
      .padding(.horizontal, 30)
      .padding(.vertical)

      Divider()
        .padding(.horizontal, 20)
    }

  }
}

#Preview {
  NavigationStack {
    TaskRow(taskItem: TaskItem(title: "Task 1", notes: "", status: .completed))
    TaskRow(taskItem: TaskItem(title: "Task 2", notes: "", status: .pending))
    Spacer()
      .navigationTitle("My Tasks")
  }
  .environmentObject(TaskItemStore())
}
