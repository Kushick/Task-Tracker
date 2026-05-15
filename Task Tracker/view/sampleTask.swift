//
//  sampleTask.swift
//  Task Tracker
//
//  Created by Kushick Chakraborty on 15/5/26.
//

import SwiftUI

struct sampleTask: View {
    @Binding  var task:Task
    var body: some View {
        HStack(){
            Button {
                task.isDone.toggle()
            } label: {
                Image(systemName: task.isDone ? "checkmark.circle.fill" :  "circle")
                    .font(.headline)
                    .foregroundStyle(.blue)
            }
            Spacer()
            Text("Hello this one of the sample test task.how it is looking?")
                .font(.headline)
                .strikethrough(task.isDone, color: Color.black)
            Spacer()
            
            Text(task.createdAt.formatted(date: .abbreviated, time:.shortened))
                .font(.caption)
                .foregroundStyle(.gray)
            
        }
        .padding()
    }
}


