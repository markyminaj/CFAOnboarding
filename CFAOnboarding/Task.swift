//
//  Task.swift
//  CFAOnboarding
//
//  Created by Mark Martin on 3/16/23.
//

import Foundation

//MARK: To dos
// - Add Checkmarks to cells based on completion
// - Add Progress Bars
// - Add a Detail View Controller for Tasks
// - Implement a video for certain tasks

struct SubTask {
    let title: String
    let completed: Bool
}

struct Task: Identifiable {
    var id: UUID
    let title: String
    let description: String
    let progress: Float
    let subtasks: [SubTask]
    var completed: Bool
    let dueDate: Date
}

struct TaskList {
    static let task1 = Task(
        id: UUID(),
        title: "Introduction - What is Chick-fil-A about?",
        description: "A quick intro to our restaurant, team, and this app",
        progress: 0.25,
        subtasks: [SubTask(title: "Task 1", completed: false),
                   SubTask(title: "Task 2", completed: false),
                   SubTask(title: "Task 3", completed: false)],
        completed: false,
        dueDate: Date(timeIntervalSinceNow: 3 * 86400) // Due in 3 days
    )
    
    static let task2 = Task(
        id: UUID(),
        title: "Finish watching our Sexual Harrasment video",
        description: "All employees are required to watch a video regarding Sexual Harrassment. The video is about an hour long.",
        progress: 0.5,
        subtasks: [SubTask(title: "Task 1", completed: false),
                   SubTask(title: "Task 2", completed: false),
                   SubTask(title: "Task 3", completed: false)],
        completed: false,
        dueDate: Date(timeIntervalSinceNow: 5 * 86400) // Due in 5 days
    )
    
    static let task3 = Task(
        id: UUID(),
        title: "Read through the employee handbook",
        description: "Review the employee handbook to ensure you understand our policies",
        progress: 0.80,
        subtasks: [SubTask(title: "Task 1", completed: false),
                   SubTask(title: "Task 2", completed: false),
                   SubTask(title: "Task 3", completed: false)],
        completed: false,
        dueDate: Date(timeIntervalSinceNow: 10 * 86400) // Due in 10 days
    )
    
    static let task4 = Task(
        id: UUID(),
        title: "Complete Orientation with Training Director",
        description: "Complete your orientation with Mark.",
        progress: 0.75,
        subtasks: [SubTask(title: "Task 1", completed: false),
                   SubTask(title: "Task 2", completed: false),
                   SubTask(title: "Task 3", completed: false)],
        completed: false,
        dueDate: Date(timeIntervalSinceNow: 2 * 86400) // Due in 10 days
    )
    
    static let task5 = Task(
        id: UUID(),
        title: "Core 4",
        description: "The first step in service, the Core 4.",
        progress: 0.15,
        subtasks: [SubTask(title: "Task 1", completed: false),
                   SubTask(title: "Task 2", completed: false),
                   SubTask(title: "Task 3", completed: false)],
        completed: false,
        dueDate: Date(timeIntervalSinceNow: 3 * 86400) // Due in 10 days
    )
    
    static let task6 = Task(
        id: UUID(),
        title: "2nd Mile Service, Elevated Language",
        description: "Going the extra mile, and the language of hospitality",
        progress: 0.50,
        subtasks: [SubTask(title: "Task 1", completed: false),
                   SubTask(title: "Task 2", completed: false),
                   SubTask(title: "Task 3", completed: false)],
        completed: false,
        dueDate: Date(timeIntervalSinceNow: 4 * 86400) // Due in 10 days
    )
    
    static let tasks = [task1, task2, task3, task4, task5, task6]
    
}

