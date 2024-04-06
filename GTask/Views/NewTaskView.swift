//
//  AddNewTaskView.swift
//  GTask
//
//  Created by Pavel Gribachev on 05.04.2024.
//

import UIKit

class NewTaskView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Создать задачу"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK:
private extension NewTaskView {
    func setUpView() {
        self.addSubview(titleLabel)
    }
}

// MARK: Constraints
private extension NewTaskView {
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}

#Preview {
    NewTaskView()
}
