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
    HStack {
      Text(taskItem.title)
        .font(.title3)
        .fontWeight(.semibold)
        .foregroundColor(Color.blue)
      
      // Hide NaviationLink cheveron
      NavigationLink(destination: TaskItemDetail(taskItem: taskItem)) {
        EmptyView()
      }
      .opacity(0.0)
      
      Spacer()
      
      Button(action: {
        withAnimation {
          taskItemStore.toggleStatus(for: taskItem)
        }
      }) {
        Image(systemName: taskItem.isCompleted ? "checkmark.square" : "square")
          .foregroundStyle(taskItem.isCompleted ? .green : .red)
          .font(.system(size: 20, weight: .bold))
      }
      .buttonStyle(BorderlessButtonStyle()) // Prevents triggering NavigationLink
    }
  }
}

#Preview {
  NavigationStack {
    VStack {
      TaskRow(taskItem: TaskItem(title: "Task 1", notes: "", status: .completed))
      TaskRow(taskItem: TaskItem(title: "Task 2", notes: "", status: .pending))
    }
    .padding(.horizontal, 30)
    .padding(.vertical)
    Spacer()
      .navigationTitle("My Tasks")
  }
  .environmentObject(TaskItemStore())
}
