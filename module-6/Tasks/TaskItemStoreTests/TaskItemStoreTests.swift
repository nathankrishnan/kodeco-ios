//
//  TaskItemStoreTests.swift
//  TaskItemStoreTests
//
//  Created by Nathan Krishnan on 6/12/24.
//

import XCTest
@testable import Tasks

final class TaskItemStoreTests: XCTestCase {
  
  var taskItemStore: TaskItemStore!
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    taskItemStore = TaskItemStore()
    
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    taskItemStore = nil
  }
  
  func testAddTask() throws {
    // Given
    let initialCount = taskItemStore.tasks.count
    let newTitle = "Important New Task"
    let newNotes = "High Priority"
    
    // When
    taskItemStore.add(title: newTitle, notes: newNotes)
    
    // Then
    XCTAssertEqual(taskItemStore.tasks.count, initialCount + 1, "Task count should increase by 1 after adding a task")
    
    let addedTask = taskItemStore.tasks.last!
    XCTAssertEqual(addedTask.title, newTitle, "Added task title should match the provided title")
    XCTAssertEqual(addedTask.notes, newNotes, "Added task notes should match the provided notes")
    XCTAssertEqual(addedTask.status, .pending, "Added task status should default to pending")
  }
  
  func testUpdateTask() throws {
    // Given
    let taskToUpdate = taskItemStore.tasks[0]
    let newTitle = "Updated Task Title"
    let newNotes = "Updated Notes"
    let newStatus = TaskItemStatus.completed
    
    // When
    taskItemStore.update(existing: taskToUpdate, title: newTitle, notes: newNotes, status: newStatus)
    
    // Then
    XCTAssertEqual(taskItemStore.tasks[0].title, newTitle, "Updated task title should match the new title")
    XCTAssertEqual(taskItemStore.tasks[0].notes, newNotes, "Updated task notes should match the new notes")
    XCTAssertEqual(taskItemStore.tasks[0].status, newStatus, "Updated task status should match the new status")
  }
  
  func testToggleStatus() throws {
    // Given
    let taskToToggle = taskItemStore.tasks[0]
    let initialStatus = taskToToggle.status
    
    // When
    taskItemStore.toggleStatus(for: taskToToggle)
    
    // Then
    XCTAssertNotEqual(taskItemStore.tasks[0].status, initialStatus, "Task status should toggle to the opposite state")
  }
}
