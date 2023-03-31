//
//  DetailViewController.swift
//  CFAOnboarding
//
//  Created by Mark Martin on 3/16/23.
//

import UIKit

protocol TaskDelegate {
    func didCompleteTask()
    func didCompleteTask(of task: Task)
}

class TaskDetailViewController: UIViewController {
    var task: Task
    var delegate: TaskDelegate
    let defaults = UserDefaults.standard
    
    let taskTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Rubik-Bold", size: 24)
        label.textAlignment = .center
        return label
    }()

    let completedButton: UIButton = {
        let button = UIButton()
        button.configuration = .borderedProminent()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.title = "Complete"
        button.configuration?.baseBackgroundColor = .systemRed
        button.addTarget(self, action: #selector(taskCompleted), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    init(with task: Task, delegate: TaskDelegate) {
        self.task = task
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        //createSubTaskList()
        checkCompletion()
        layout()
        taskTitleLabel.text = task.title
    }
    
    private func checkCompletion() {
        
        if task.completed {
            completedButton.configuration = .borderedProminent()
            completedButton.configuration?.baseBackgroundColor = .systemGreen
            completedButton.configuration?.title = "Finished"
        } else {
            completedButton.configuration = .borderedProminent()
            completedButton.configuration?.title = "Complete"
            completedButton.configuration?.baseBackgroundColor = .systemRed
        }
        
    }
    
    @objc private func taskCompleted(_sender: UIButton) {
        task.completed.toggle()
        checkCompletion()
        delegate.didCompleteTask(of: task)
    }
    
    private func createSubTaskList() {
        for task in task.subtasks {
            print(task)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        view.backgroundColor = .systemBackground
        view.addSubview(taskTitleLabel)
        view.addSubview(completedButton)
        
        NSLayoutConstraint.activate([
            taskTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            taskTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            taskTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant:  -8),
            
            completedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            completedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            completedButton.widthAnchor.constraint(equalToConstant: 350),
            completedButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}



