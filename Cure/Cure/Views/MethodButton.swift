//
//  MethodButton.swift
//  Cure
//
//  Created by Young Kim on 4/18/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import UIKit

enum MethodButtonType {
    case get
    case post
    case delete
}

class MethodButton: UIButton {
    
    var methodButtonType: MethodButtonType
    
    init(methodButtonType: MethodButtonType) {
        self.methodButtonType = methodButtonType
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 7
        self.layer.borderColor = UIColor.shaleGray.cgColor
        self.layer.borderWidth = 1
        self.titleLabel?.font = UIFont.avenirMedium?.withSize(16)
        self.setTitleColor(.shaleGray, for: .normal)
        self.titleLabel?.textAlignment = .center
        
        switch methodButtonType {
        case .get:
            self.setTitle("GET", for: .normal)
            self.isSelected = true
        case .post:
            self.setTitle("POST", for: .normal)
        case .delete:
            self.setTitle("DELETE", for: .normal)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.layer.borderWidth = 0
                self.setTitleColor(.white, for: .normal)
                switch methodButtonType {
                case .get:
                    self.titleLabel?.textColor = UIColor.white
                    self.backgroundColor = .cyanGreen
                case .post:
                    self.titleLabel?.textColor = UIColor.white
                    self.backgroundColor = .happyYellow
                case .delete:
                    self.titleLabel?.textColor = UIColor.white
                    self.backgroundColor = .coralPink
                }
            } else {
                self.layer.borderWidth = 1
                self.setTitleColor(.shaleGray, for: .normal)
                self.backgroundColor = .white
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
