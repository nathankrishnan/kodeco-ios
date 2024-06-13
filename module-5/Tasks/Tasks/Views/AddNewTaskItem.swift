//
//  AddNewTask.swift
//  Tasks
//
//  Created by Nathan Krishnan on 6/9/24.
//

import SwiftUI

struct AddNewTaskItem: View {
  @State private var taskTitle = ""
  @State private var notes = ""
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var taskItemStore: TaskItemStore
  
  var body: some View {
    NavigationView {
      Form {
        Section("Task Title") {
          TextField("Test", text: $taskTitle)
        }
        Section("Notes") {
          TextField("Notes", text: $notes)
        }
      }
      .navigationBarTitle("Adding New Task", displayMode: .inline)
      .navigationBarItems(leading: Button(action: { dismiss() }, label: {
        Text("Cancel")
      }), trailing: Button(action: {
        taskItemStore.add(title: taskTitle, notes: notes)
        dismiss()
      }, label: {
        Text("Add")
      }))
    }
  }
}

#Preview {
  AddNewTaskItem()
    .environmentObject(TaskItemStore())
}
