//
//  sampleTask.swift
//  Task Tracker
//
//  Created by Kushick Chakraborty on 15/5/26.
//

import SwiftUI

struct sampleTask: View {
    @Binding  var task:Task
    var onToogle:()-> Void
    
    var body: some View {
        HStack(){
            Button {
                task.isDone.toggle()
                onToogle()
            } label: {
                Image(systemName: task.isDone ? "checkmark.circle.fill" :  "circle")
                    .font(.headline)
                    .foregroundStyle(.blue)
            }
            VStack{
                Text(task.task)
                    .font(.headline)
                    .strikethrough(task.isDone, color: Color.black)
                
                Text(task.createdAt.formatted(date: .abbreviated, time:.shortened))
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
        }
        .padding()
    }
}


