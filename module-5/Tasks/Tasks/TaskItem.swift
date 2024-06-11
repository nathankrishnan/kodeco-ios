//
//  Task.swift
//  Tasks
//
//  Created by Nathan Krishnan on 6/10/24.
//

import Foundation
import SwiftUI

enum TaskItemStatus {
  case pending
  case completed
}

struct TaskItem: Identifiable {
  let id = UUID()
  var title: String
  var notes: String
  var status: TaskItemStatus
}

