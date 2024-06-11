//
//  TaskStore.swift
//  Tasks
//
//  Created by Nathan Krishnan on 6/10/24.
//

import Foundation

class TaskItemStore: ObservableObject {
  @Published var tasks: [TaskItem] = [
    TaskItem(title: "Task 1", notes: "", status: .pending),
    TaskItem(title: "Task 2", notes: "", status: .completed),
    TaskItem(title: "Task 3", notes: "", status: .pending),
    TaskItem(title: "Task 4", notes: "", status: .completed),
    TaskItem(title: "Task 5", notes: "", status: .pending)
  ]

  func addNewTaskItem(title: String, notes: String, status: TaskItemStatus = .pending) {
    let taskTitle = title.isEmpty ? "New Task" : title
    tasks.append(TaskItem(title: taskTitle, notes: notes, status: status))
  }

  func updateTaskItem(id: UUID, title: String, notes: String, status: TaskItemStatus) {
    if let index = tasks.firstIndex(where: { $0.id == id }) {
      tasks[index].title = title
      tasks[index].notes = notes
      tasks[index].status = status
    }
  }

  func updateTaskItem(id: UUID, status: TaskItemStatus = .completed) {
    if let index = tasks.firstIndex(where: { $0.id == id }) {
      tasks[index].status = status
    }
  }
}
