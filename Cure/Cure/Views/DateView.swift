//
//  DateView.swift
//  Cure
//
//  Created by Young Kim on 4/27/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import UIKit

class DateView: UIView {
    
    var lastCheckedDateLabel: UILabel!
    var lastCheckedVerticalView: UIView!
    var lastCheckedTimeLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        lastCheckedDateLabel = UILabel()
        lastCheckedDateLabel.font = UIFont.avenirRegular?.withSize(14)
        lastCheckedDateLabel.textColor = UIColor.darkGray
        self.addSubview(lastCheckedDateLabel)
        
        lastCheckedVerticalView = UIView()
        lastCheckedVerticalView.backgroundColor = UIColor.lightGray
        self.addSubview(lastCheckedVerticalView)
        
        lastCheckedTimeLabel = UILabel()
        lastCheckedTimeLabel.font = UIFont.avenirRegular?.withSize(14)
        lastCheckedTimeLabel.textColor = UIColor.darkGray
        self.addSubview(lastCheckedTimeLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        lastCheckedDateLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
        }
        lastCheckedVerticalView.snp.makeConstraints { make in
            make.centerY.equalTo(lastCheckedDateLabel.snp.centerY)
            make.leading.equalTo(lastCheckedDateLabel.snp.trailing).offset(6)
            make.width.equalTo(0.5)
            make.height.equalTo(9)
        }
        lastCheckedTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(lastCheckedDateLabel.snp.top)
            make.leading.equalTo(lastCheckedVerticalView.snp.trailing).offset(6)
            make.trailing.equalToSuperview()
        }
    }
    
    func configure(date: String, time: String) {
        lastCheckedDateLabel.text = date
        lastCheckedTimeLabel.text = time
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
