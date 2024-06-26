//
//  ContentView.swift
//  Tasks
//
//  Created by Nathan Krishnan on 6/6/24.
//

import SwiftUI

struct TaskList: View {
  @EnvironmentObject var taskItemStore: TaskItemStore
  @State private var isNewTaskPresented = false

  var body: some View {
    NavigationStack {
      VStack {
        ForEach(taskItemStore.tasks) { taskItem in
          NavigationLink(destination: TaskItemDetail(taskItem: taskItem)) {
            TaskRow(taskItem: taskItem)
          }
        }
      }
      Spacer()
      HStack {
        NewTaskButton(isPresented: $isNewTaskPresented)
        Spacer()
      }
      .sheet(isPresented: $isNewTaskPresented) {
        AddNewTaskItem()
      }
      .padding(.leading, 20)
      .navigationTitle("My Tasks")
    }
  }
}

struct NewTaskButton: View {
  @Binding var isPresented: Bool

  var body: some View {
    Button(action: {
      isPresented.toggle()
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
