//
//  TaskStore.swift
//  Tasks
//
//  Created by Nathan Krishnan on 6/10/24.
//

import Foundation

/// Manages a collection of task items.
class TaskItemStore: ObservableObject {
  @Published var tasks: [TaskItem] = [
    TaskItem(title: "Task 1", notes: "First", status: .pending),
    TaskItem(title: "Task 2", notes: "Second", status: .completed),
    TaskItem(title: "Task 3", notes: "Third", status: .pending),
    TaskItem(title: "Task 4", notes: "Forth", status: .completed),
    TaskItem(title: "Task 5", notes: "Fifth", status: .pending)
  ]

  /// Adds a new task item to the store.
  /// - Parameters:
  ///   - title: The title of the task item. If empty, defaults to "New Task".
  ///   - notes: Additional notes for the task item.
  ///   - status: The status of the task item. The default value is pending.
  func add(title: String, notes: String, status: TaskItemStatus = .pending) {
    let taskTitle = title.isEmpty ? "New Task" : title
    tasks.append(TaskItem(title: taskTitle, notes: notes, status: status))
  }

  /// Updates an existing task item with new information.
  /// - Parameters:
  ///   - existing: The task item to update.
  ///   - title: New title for the task item. If `nil`, title remains unchanged.
  ///   - notes: New notes for the task item. If `nil`, notes remain unchanged.
  ///   - status: New status for the task item. If `nil`, status remains unchanged.
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

  /// Toggles the completion status of a task item.
  /// - Parameter taskItem: The task item whose status should be toggled.
  func toggleStatus(for taskItem: TaskItem) {
    let newStatus: TaskItemStatus = (taskItem.isCompleted) ? .pending : .completed
    update(existing: taskItem, title: taskItem.title, notes: taskItem.notes, status: newStatus)
  }
}
