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

  /*
   TaskItems are filtered by their title only when the user is actively searching.
   When the searchText is empty, the filter ignores the title,
   showing all tasks that match the completion status
  */
  var filteredTasks: [TaskItem] {
    taskItemStore.tasks.filter {
      (filterByTaskItemStatus == .pending ? !$0.isCompleted : $0.isCompleted) &&
      ($0.title.lowercased().contains(searchText.lowercased()) || searchText.isEmpty)
    }
  }

  var body: some View {
    NavigationStack {
      VStack {
        if filteredTasks.isEmpty {
          Text(filterByTaskItemStatus == .pending ?
               "Congratulations! All tasks completed." :
                "You have tasks to work on. You got this!")
          .foregroundStyle(Color.gray)
          .padding()

        } else {
          List {
            ForEach(filteredTasks) { taskItem in
              TaskRow(taskItem: taskItem)
            }
          }
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
