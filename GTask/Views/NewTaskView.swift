//
//  AddNewTaskView.swift
//  GTask
//
//  Created by Pavel Gribachev on 05.04.2024.
//

import UIKit

class NewTaskView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
