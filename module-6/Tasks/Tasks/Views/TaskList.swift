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
  @State private var searchText = ""
  var filterByTaskItemStatus: TaskItemStatus = .pending
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(taskItemStore.tasks.filter { (filterByTaskItemStatus == .pending ? !$0.isCompleted : $0.isCompleted) && ($0.title.contains(searchText) || searchText.isEmpty) }) { taskItem in
          TaskRow(taskItem: taskItem)
        }
      }
      .navigationTitle("My Tasks")
      .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Tasks")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          NewTaskButton(isPresented: $isNewTaskPresented)
        }
      }
      .sheet(isPresented: $isNewTaskPresented) {
        AddNewTaskItem()
      }
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
      }
    }
  }
}

#Preview {
  TaskList()
    .environmentObject(TaskItemStore())
}
