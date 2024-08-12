//
//  TaskRow.swift
//  Tasks
//
//  Created by Nathan Krishnan on 6/9/24.
//

import SwiftUI

struct TaskRow: View {
  @EnvironmentObject var taskItemStore: TaskItemStore
  @State private var isAnimating = false
  let taskItem: TaskItem

  private var currentSystemImage: String {
    if isAnimating {
      return taskItem.isCompleted ? "square" : "checkmark.square"
    } else {
      return taskItem.isCompleted ? "checkmark.square" : "square"
    }
  }

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
        withAnimation(.easeInOut(duration: 0.4)) {
          isAnimating = true
        }
        // Delay the taskItem status change to let the animation complete
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
          taskItemStore.toggleStatus(for: taskItem)
          isAnimating = false
        }
      }) {
        Image(systemName: currentSystemImage)
          .font(.system(size: 20, weight: .bold))
          .foregroundStyle(isAnimating ? (taskItem.isCompleted ? .red : .green) : (taskItem.isCompleted ? .green : .red))
          .scaleEffect(isAnimating ? 1.4 : 1.0)
          .opacity(isAnimating ? 0.5 : 1.0)
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
