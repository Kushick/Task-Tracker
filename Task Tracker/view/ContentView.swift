//
//  ContentView.swift
//  Task Tracker
//
//  Created by Kushick Chakraborty on 14/5/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var showDialog :Bool = false
    @State private var newTask = ""
    
    @Query private var tasks:[Task]
    @StateObject private var vm = TaskTrackerVM()
    
    var body: some View {
        NavigationStack{
            LazyVStack{
                
                if tasks.isEmpty{
                    EmptyView()
                }
                else{
                    Text("Your today's progression is \(Int(vm.progressbarValue*100)) %")
                        .font(.title2)
                    
                    Text("Total task :\(vm.totalTask)")
                        .font(.default)
                    
                    Text("Completed task :\(vm.completedTask)")
                        .font(.default)
                    
                    Text("Remained task :\(vm.remainedTask)")
                        .font(.default)
                }
                
                
                ProgressView(value: vm.progressbarValue)
                    .animation(.easeInOut,value: vm.progressbarValue)
                    .progressViewStyle(.linear)
                    .scaleEffect(x: 1, y: 2, anchor:.center)
                    .padding()
                
                Text("Your tasks")
                    .foregroundStyle(.white)
                    .padding(15)
                    .font(.default)
                    .fontWeight(.heavy)
                    .background(.gray)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 15)
                    )
                
                Divider()
                
                if(tasks.isEmpty){
                    Text("Hurray! no tasks remains!!!")
                        .font(.largeTitle)
                }else{
                    List{
                        ForEach(tasks){ task in
                            sampleTask(task: task)
                                .onTapGesture {
                                    vm.toggleTask(
                                            task,
                                            context: context,
                                            tasks: tasks
                                        )
                                }
                        }
                        .onDelete{ offsets in
                            vm.deleteTask(
                                at: offsets,
                                tasks: tasks,
                                context: context
                            )
                            vm.updateTask(tasks: tasks)
                        }
                        .onMove {indexSet,toDestination in
                            vm.moveTask(
                                tasks: tasks, context: context,
                                    source: indexSet,
                                    toDestination: toDestination
                                )
                        }
                    }
                    .listRowSpacing(1)
                    .listStyle(.plain)
                    .layoutPriority(1)
                }
                
                Button{
                    showDialog.toggle()
                }label: {
                    Text("Add new tasks")
                        .padding(15)
                        .font(.default)
                        .fontWeight(.heavy)
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
                vm.addTask(
                    taskName: newTask,
                    context: context)
                newTask=""
                vm.updateTask(tasks: tasks)
            }
            Button("Cancel",role: .cancel){}
        }
        .onAppear{
            vm.updateTask(tasks: tasks)
        }
    }  
}

#Preview {
    ContentView()
}
