//
//  ViewController.swift
//  CFAOnboarding
//
//  Created by Mark Martin on 3/16/23.
//

import UIKit


class ViewController: UIViewController {
    
    let taskList = TaskList.tasks
    
    var tableView = UITableView()
    let taskCellID = "cellID"
    
    private let headerImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension ViewController {
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

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: taskCellID, for: indexPath) as! TaskTableViewCell
        cell.configure(task: taskList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = taskList[indexPath.row]
        navigationController?.pushViewController(TaskDetailViewController(with: task), animated: true)
    }
}


