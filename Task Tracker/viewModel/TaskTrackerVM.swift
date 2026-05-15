//
//  TaskTrackerVM.swift
//  Task Tracker
//
//  Created by Kushick Chakraborty on 15/5/26.
//

import SwiftUI
import SwiftData
import Combine

class TaskTrackerVM:ObservableObject{
    
    @Published var totalTask:Int=0
    @Published var completedTask:Int=0
    @Published var remainedTask:Int=0
    @Published var progressbarValue:Double=0.0
    
    func updateTask(tasks:[Task]){
        totalTask = tasks.count
        completedTask=tasks.filter{$0.isDone}.count
        remainedTask = totalTask-completedTask
        
        if totalTask==0{
            progressbarValue=0
        }else{
            progressbarValue = Double(completedTask)/Double(totalTask)
        }
    }
    
    func addTask(taskName:String,context:ModelContext){
        let newTask = Task(
            task: taskName,
            createdAt: Date(),
            isDone: false
        )
        context.insert(newTask)
    }
    
    func deleteTask(at offsets:IndexSet,tasks:[Task],context:ModelContext){
        for index in offsets{
            context.delete(tasks[index])
        }
    }

}
