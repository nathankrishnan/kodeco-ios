//
//  TaskStore.swift
//  Tasks
//
//  Created by Nathan Krishnan on 6/10/24.
//

import Foundation

class TaskItemStore: ObservableObject {
  @Published var tasks: [TaskItem] = [
    TaskItem(title: "Task 1", notes: "First", status: .pending),
    TaskItem(title: "Task 2", notes: "Second", status: .completed),
    TaskItem(title: "Task 3", notes: "Third", status: .pending),
    TaskItem(title: "Task 4", notes: "Forth", status: .completed),
    TaskItem(title: "Task 5", notes: "Fifth", status: .pending)
  ]

  func add(title: String, notes: String, status: TaskItemStatus = .pending) {
    let taskTitle = title.isEmpty ? "New Task" : title
    tasks.append(TaskItem(title: taskTitle, notes: notes, status: status))
  }

  func update(existing taskItem: TaskItem, title: String?, notes: String?, status: TaskItemStatus?) {
    guard let index = tasks.firstIndex(where: { $0.id == taskItem.id }) else {
      return
    }

    if let newTitle = title {
      tasks[index].title = newTitle
    }

    if let newNotes = notes {
      tasks[index].notes = newNotes
    }

    if let newStatus = status {
      tasks[index].status = newStatus
    }
  }

  func toggleStatus(for taskItem: TaskItem) {
    let newStatus: TaskItemStatus = (taskItem.isCompleted) ? .pending : .completed
    update(existing: taskItem, title: taskItem.title, notes: taskItem.notes, status: newStatus)
  }
}
