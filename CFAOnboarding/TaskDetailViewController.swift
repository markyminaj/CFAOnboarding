//
//  DetailViewController.swift
//  CFAOnboarding
//
//  Created by Mark Martin on 3/16/23.
//

import UIKit

class TaskDetailViewController: UIViewController {
    var task: Task
    var completed: Bool = false
    
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
    
    init(with task: Task) {
        self.task = task
        super.init(nibName: nil, bundle: nil)
        
        layout()
        taskTitleLabel.text = task.title
    }
    
    @objc private func taskCompleted(_sender: UIButton) {
        print("Task Completed")
        completed = !completed
        if completed {
            completedButton.configuration = .borderedProminent()
            completedButton.configuration?.baseBackgroundColor = .systemGreen
            completedButton.configuration?.title = "Finished"
        } else {
            completedButton.configuration = .borderedProminent()
            completedButton.configuration?.title = "Complete"
            completedButton.configuration?.baseBackgroundColor = .systemRed
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


