//
//  Task.swift
//  GTask
//
//  Created by Pavel Gribachev on 03.04.2024.
//

import Foundation

struct Task {
    let title: String
    let description: String
    
    let isCompleted: Bool
    
    static func getTasks() -> [Task] {
        var tasks: [Task] = []
        
        for _ in 1...5 {
            let task = Task(title: "Tom", description: "Hardley", isCompleted: true)
            tasks.append(task)
        }
        
        return tasks
    }
}
