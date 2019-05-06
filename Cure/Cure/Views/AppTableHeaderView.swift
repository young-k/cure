//
//  AppTableHeaderView.swift
//  Cure
//
//  Created by Young Kim on 4/24/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import UIKit

class AppTableHeaderView: UIView {
    
    var testsLabel: UILabel!
    var numTestsLabel: UILabel!
    
    var footerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        testsLabel = UILabel()
        testsLabel.font = UIFont.avenirMedium?.withSize(20)
        testsLabel.text = "Tests"
        self.addSubview(testsLabel)
        
        numTestsLabel = UILabel()
        numTestsLabel.font = UIFont.avenirMedium?.withSize(20)
        self.addSubview(numTestsLabel)
        
        footerView = UIView()
        footerView.backgroundColor = .black
        self.addSubview(footerView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        testsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(35)
            make.top.equalToSuperview()
        }
        numTestsLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(35)
            make.top.equalToSuperview()
        }
        footerView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(testsLabel.snp.bottom).offset(4)
            make.trailing.leading.equalToSuperview().inset(34)
        }
    }
    
    func configure(for numTests: Int) {
        numTestsLabel.text = "\(numTests)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
