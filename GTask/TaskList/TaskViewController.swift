//
//  ViewController.swift
//  GTask
//
//  Created by Pavel Gribachev on 03.04.2024.
//

import UIKit

class TaskViewController: UIViewController {
    
    private lazy var buttonAdd: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "addButtonImage")
//        button.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        button.setBackgroundImage(image, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let cellID = "taskCell"
    private let storageManager = StorageManager.shared
    private var taskList = Task.getTasks()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        setUpView()
        setUpConstraints()
        
    }
}

// MARK: Constraints
private extension TaskViewController {
    func setUpConstraints() {
        
        // UILayoutGuide
        let guide = UILayoutGuide()
        view.addLayoutGuide(guide)
        
        NSLayoutConstraint.activate([
            guide.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75),
            guide.widthAnchor.constraint(equalTo: view.widthAnchor),
            guide.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            guide.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // buttonAdd
        NSLayoutConstraint.activate([
            buttonAdd.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            
            buttonAdd.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonAdd.widthAnchor.constraint(equalToConstant: 120),
            buttonAdd.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}

// MARK: ViewController Style
private extension TaskViewController {
    
    func setUpView() {
        setNavItem()
        setTableView()
        setButtonAdd()
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
    
    func setButtonAdd() {
        view.addSubview(buttonAdd)
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
