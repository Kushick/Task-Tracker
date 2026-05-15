//
//  Task.swift
//  Task Tracker
//
//  Created by Kushick Chakraborty on 14/5/26.
//

import SwiftUI
import SwiftData

@Model
class Task{
    var task:String
    var createdAt:Date
    var isDone:Bool
    
    init(task: String, createdAt: Date, isDone: Bool) {
        self.task = task
        self.createdAt = createdAt
        self.isDone = isDone
    }
}

