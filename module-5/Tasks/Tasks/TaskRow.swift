//
//  TaskRow.swift
//  Tasks
//
//  Created by Nathan Krishnan on 6/9/24.
//

import SwiftUI

struct TaskRow: View {
  var body: some View {
    HStack {
      Text("Task 1")
        .font(.title3)
        .fontWeight(.semibold)
        .foregroundColor(Color.blue)
      Spacer()
      Image(systemName: "checkmark.square")
        .foregroundStyle(.green)
        .font(.system(size: 20, weight: .bold))
    }
    .padding(.horizontal, 30)
  }
}

#Preview {
  TaskRow()
}
