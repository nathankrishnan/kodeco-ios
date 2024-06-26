//
//  TaskDetail.swift
//  Tasks
//
//  Created by Nathan Krishnan on 6/9/24.
//

import SwiftUI

struct TaskItemDetail: View {
  @State private var taskTitle = ""
  @State private var notes = ""
  @State private var isCompleted = false
  @EnvironmentObject var taskItemStore: TaskItemStore
  let taskItem: TaskItem

  var body: some View {
    Form {
      Section("Task Title") {
        TextField("Task", text: $taskTitle)
          .onChange(of: taskTitle) { _, newTaskTitle in
            taskItemStore.update(existing: taskItem, title: newTaskTitle, notes: nil, status: nil)
          }
      }
      Section("Notes") {
        TextField("Notes", text: $notes)
          .onChange(of: notes) { _, newNotes in
            taskItemStore.update(existing: taskItem, title: nil, notes: newNotes, status: nil)
          }
      }
      Section {
        Toggle(isOn: $isCompleted, label: {
          Text("Completed:")
        })
        .onChange(of: isCompleted) {
          let newStatus: TaskItemStatus = isCompleted ? .completed : .pending
          taskItemStore.update(existing: taskItem, title: nil, notes: nil, status: newStatus)
        }
      }
    }
    .onAppear {
      taskTitle = taskItem.title
      notes = taskItem.notes
      isCompleted = taskItem.isCompleted
    }
  }
}

#Preview {
  TaskItemDetail(taskItem: TaskItem(title: "Test", notes: "TODO", status: .completed))
    .environmentObject(TaskItemStore())
}
