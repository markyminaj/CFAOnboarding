//
//  ViewController.swift
//  CFAOnboarding
//
//  Created by Mark Martin on 3/16/23.
//

import UIKit


class TaskViewController: UIViewController, TaskDelegate {
    func didCompleteTask() {

    }
    
    func didCompleteTask(of task: Task) {
        taskList[taskSelected] = task
        tableView.reloadData()
    }
    let defaults = UserDefaults.standard
    var taskSelected: Int = 0
    var taskList = TaskList.tasks
    
    var tableView = UITableView()
    let taskCellID = "cellID"
    
    private let headerImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        title = "Tasks"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

extension TaskViewController {
    private func setup() {
        setupHeaderImage()
        setupTableView()
    }
    
    private func setupHeaderImage() {
        view.addSubview(headerImageView)
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        headerImageView.image = UIImage(systemName: "book")
        headerImageView.tintColor = .systemRed
        headerImageView.backgroundColor = .systemBackground
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: taskCellID)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension TaskViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: taskCellID, for: indexPath) as! TaskTableViewCell
        cell.configure(task: taskList[indexPath.row])
        cell.selectionStyle = .none
        print("Task: \(taskList[indexPath.row].title) is \(taskList[indexPath.row].completed)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
}

extension TaskViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = taskList[indexPath.row]
        taskSelected = indexPath.row
        navigationController?.pushViewController(TaskDetailViewController(with: task, delegate: self), animated: true)
    }
}


