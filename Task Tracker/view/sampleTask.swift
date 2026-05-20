//
//  sampleTask.swift
//  Task Tracker
//
//  Created by Kushick Chakraborty on 15/5/26.
//

import SwiftUI

struct sampleTask: View {
    var task:Task
    
    var body: some View {
        HStack(){
            
            Image(systemName: "line.3.horizontal.decrease")
                .symbolEffect(.pulse)
            Button {
                task.isDone.toggle()
            } label: {
                Image(systemName: task.isDone ? "checkmark.circle.fill" :  "circle")
                    .font(.headline)
                    .foregroundStyle(.blue)
            }
            VStack{
                Text(task.task)
                    .font(.headline)
                    .strikethrough(
                        task.isDone,
                        color: Color.red
                    )
                
                Text(task.createdAt.formatted(date: .abbreviated, time:.shortened))
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
        }
        .padding()
    }
}


