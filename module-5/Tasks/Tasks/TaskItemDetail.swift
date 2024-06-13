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
          .onChange(of: taskTitle) { newTaskTitle in
            // TODO
            print("")
          }
      }
      Section("Notes") {
        TextField("Notes", text: $notes)
      }
      Section {
        Toggle(isOn: $isCompleted, label: {
          Text("Completed:")
        })
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
