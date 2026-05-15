//
//  ContentView.swift
//  Task Tracker
//
//  Created by Kushick Chakraborty on 14/5/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showDialog :Bool = false
    @State private var newTask = ""
    
    @State var tasks = [
        Task(task: "Hello this one of the sample test task.how it is looking?",
             createdAt: Date(),
             isDone: true
            ),
        
        Task(task: "Hello this one of the sample test task.how it is looking?",
             createdAt: Date(),
             isDone: false
            ),
        
        Task(task: "Hello this one of the sample test task.how it is looking?",
             createdAt: Date(),
             isDone: true
            )
    ]
    
    @State private var totalTask:Int=0
    @State private var completedTask:Int=0
    @State private var remainedTask:Int=0
    
    @State private var progressbarValue:Double=0.0
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Your today's progression is \(Int(progressbarValue*100)) %")
                    .font(.title2)
                
                Text("Total task :\(totalTask)")
                    .font(.default)
                
                Text("Completed task :\(completedTask)")
                    .font(.default)
                
                Text("Remained task :\(remainedTask)")
                    .font(.default)
                
                
                ProgressView(value: progressbarValue)
                    .animation(.easeInOut,value: progressbarValue)
                    .progressViewStyle(.linear)
                    .scaleEffect(x: 1, y: 2, anchor:.center)
                    .padding()
                
                Text("Your tasks")
                    .foregroundStyle(.white)
                    .padding(15)
                    .font(.default)
                    .fontWeight(.heavy)
                    .frame(width: .infinity,height: .infinity)
                    .background(.gray)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 15)
                    )
                
                Divider().frame(width: .infinity).background(.black)
                
                List{
                    ForEach($tasks,id: \.self){ task in
                        sampleTask(task: task, onToogle:{
                            updateTask()
                        })
                    }
                    .onDelete(perform: deleteTask)
                }
                .listRowSpacing(1)
                .listStyle(.plain)
                
                Button{
                    showDialog.toggle()
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
            .padding(5)
            .navigationTitle("Task tracker")
        }
        .alert("Enter your task", isPresented: $showDialog){
            TextField("Task name",text: $newTask)
            Button("Add task",role: .confirm){
                guard !newTask.isEmpty else { return }
                tasks.append(
                    Task(task:newTask,
                         createdAt: Date(),
                         isDone: false
                        )
                )
                newTask=""
                updateTask()
            }
            Button("Cancel",role: .cancel){}
        }
        .onAppear{
            updateTask()
        }
    }
    
    func updateTask(){
        totalTask = tasks.count
        completedTask=tasks.filter{$0.isDone}.count
        remainedTask = totalTask-completedTask
        
        if totalTask==0{
            progressbarValue=0
        }else{
            progressbarValue = Double(completedTask)/Double(totalTask)
        }
    }
    
    func deleteTask(at offsets:IndexSet){
        tasks.remove(atOffsets:offsets)
        updateTask()
    }
}

#Preview {
    ContentView()
}
