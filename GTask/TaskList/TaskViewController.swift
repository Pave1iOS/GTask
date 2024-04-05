//
//  ViewController.swift
//  GTask
//
//  Created by Pavel Gribachev on 03.04.2024.
//

import UIKit

class TaskViewController: UIViewController {
    
    private let cellID = "taskCell"
    private let storageManager = StorageManager.shared
    private var taskList = Task.getTasks()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        view.backgroundColor = .darkGray
    }
}

// MARK: ViewController Style
extension TaskViewController {
    
    func setUpView() {
        setNavItem()
        setTableView()
    }
    
    // navigationController
    func setNavItem() {
        navigationItem.title = "Задачи"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // tableViewController
    func setTableView() {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), style: .grouped)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        view.addSubview(tableView)
    }
}

extension TaskViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) 
        cell.backgroundColor = .clear
        
        let task = taskList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = task.title
        
        cell.contentConfiguration = content
        return cell
    }
}

#Preview {
    TaskViewController()
}
