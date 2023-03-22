//
//  DetailViewController.swift
//  CFAOnboarding
//
//  Created by Mark Martin on 3/16/23.
//

import UIKit

class DetailViewController: UIViewController {
    var task: Task
    
    
    
    let taskTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Rubik-Bold", size: 24)
        label.textAlignment = .center
        return label
    }()
    
    init(with task: Task) {
        self.task = task
        super.init(nibName: nil, bundle: nil)
        
        layout()
        taskTitleLabel.text = task.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        view.backgroundColor = .systemBackground
        view.addSubview(taskTitleLabel)
        
        NSLayoutConstraint.activate([
            taskTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            taskTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            taskTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant:  -8)
        ])
    }
}


