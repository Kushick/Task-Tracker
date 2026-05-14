//
//  ContentView.swift
//  Task Tracker
//
//  Created by Kushick Chakraborty on 14/5/26.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks = [
        Task(task: "Hello this one of the sample test task.how it is looking?",
             createdAt: Date(),
             isDone: true
            ),
        
        Task(task: "Hello this one of the sample test task.how it is looking?",
             createdAt: Date(),
             isDone: true
            ),
        
        Task(task: "Hello this one of the sample test task.how it is looking?",
             createdAt: Date(),
             isDone: true
            )
    ]
    
    @State private var taskValue = 0
    
    @State private var progressbarValue:Double=0.0
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                Text("Your today's progression is \(progressbarValue) %")
                    .font(.title)
                ProgressView()
                    .progressViewStyle(.linear)
                    .scaleEffect(x: 1, y: 2, anchor:.center)
                    .padding()
                Text("Your tasks")
                    .padding(15)
                    .font(.default)
                    .fontWeight(.heavy)
                    .frame(width: .infinity,height: .infinity)
                    .background(.gray)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 15)
                    )
                Spacer()
               
                List{
                    ForEach(tasks,id: \.self){ task in
                        Text(task.task)
                    }
                    .onDelete(perform: deleteTask)
                }
                .padding()
                .listStyle(.plain)
                
                Button{
                    let newTask = Task(
                        task: "hello this is a new task",
                        createdAt: Date(),
                        isDone: true
                    )
                    tasks.append(newTask)
                    taskValue=tasks.count
//                    progressbarValue+=1
                }label: {
                    Text("Add new tasks")
                        .padding(15)
                        .font(.default)
                        .fontWeight(.heavy)
                        .frame(width: .infinity,height: .infinity)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15)
                        )
                }

            }
        }
    }
    func deleteTask(at offsets:IndexSet){
        tasks.remove(atOffsets:offsets)
    }
}

#Preview {
    ContentView()
}
