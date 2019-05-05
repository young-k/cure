//
//  AppTestTableViewCell.swift
//  Cure
//
//  Created by Young Kim on 4/27/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import UIKit

class AppTestTableViewCell: UITableViewCell {
    
    var backgroundCellView: UIView!
    
    var testNameLabel: UILabel!
    var resultLabel: UILabel!
    var testRunDateView: DateView!
    
    var testTypeBackgroundView: UIView!
    var testTypeLabel: UILabel!
    
    var requestTypeBackgroundView: UIView!
    var requestTypeLabel: UILabel!
    
    var requestStatusLabel: UILabel!
    
    var checksImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .sleetGray
        
        backgroundCellView = UIView()
        backgroundCellView.backgroundColor = .white
        backgroundCellView.clipsToBounds = true
        backgroundCellView.layer.cornerRadius = 12
        backgroundCellView.layer.shadowColor = UIColor.lightGray.cgColor
        backgroundCellView.layer.shadowOffset = CGSize(width: 0, height: 4)
        backgroundCellView.layer.shadowOpacity = 1
        backgroundCellView.layer.shadowRadius = 4
        self.contentView.addSubview(backgroundCellView)
        
        testNameLabel = UILabel()
        testNameLabel.font = UIFont.avenirMedium?.withSize(16)
        testNameLabel.textColor = .black
        backgroundCellView.addSubview(testNameLabel)
        
        resultLabel = UILabel()
        resultLabel.text = "Result: "
        resultLabel.font = UIFont.avenirMedium?.withSize(14)
        resultLabel.textColor = UIColor.darkGray
        backgroundCellView.addSubview(resultLabel)
        
        requestStatusLabel = UILabel()
        requestStatusLabel.font = UIFont.avenirBold?.withSize(14)
        requestStatusLabel.textColor = UIColor.coralPink
        backgroundCellView.addSubview(requestStatusLabel)
        
        testRunDateView = DateView()
        backgroundCellView.addSubview(testRunDateView)
        
        checksImageView = UIImageView()
        checksImageView.contentMode = .scaleAspectFit
        backgroundCellView.addSubview(checksImageView)
        
        requestTypeBackgroundView = UIView()
        requestTypeBackgroundView.backgroundColor = UIColor.cureIndigo
        requestTypeBackgroundView.layer.cornerRadius = 8
        backgroundCellView.addSubview(requestTypeBackgroundView)
        
        requestTypeLabel = UILabel()
        requestTypeLabel.font = UIFont.avenirMedium?.withSize(12)
        requestTypeLabel.textColor = .white
        requestTypeBackgroundView.addSubview(requestTypeLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        backgroundCellView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(35)
            make.top.height.equalToSuperview()
        }
        testNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.leading.equalToSuperview().offset(18)
        }
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(testNameLabel.snp.bottom).offset(17)
            make.leading.equalTo(testNameLabel.snp.leading)
        }
        testRunDateView.snp.makeConstraints { make in
            make.centerY.equalTo(resultLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(17)
        }
        checksImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.trailing.equalToSuperview().inset(17)
            make.width.height.equalTo(16)
        }
        requestTypeBackgroundView.snp.makeConstraints { make in
            make.height.equalTo(38)
            make.width.equalTo(64)
            make.top.equalToSuperview().offset(-8)
            make.trailing.equalToSuperview().inset(50)
        }
        requestStatusLabel.snp.makeConstraints { make in
            make.leading.equalTo(resultLabel.snp.trailing)
            make.centerY.equalTo(resultLabel.snp.centerY)
        }
        requestTypeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(4)
        }
    }
    
    func configure(for result: ProcessedTestResult) {
        if result.success {
            requestStatusLabel.text = "PASS"
            requestStatusLabel.textColor = UIColor.cyanGreen
            checksImageView.image = UIImage(named: "greenDot")
        } else {
            requestStatusLabel.text = "FAIL"
            requestStatusLabel.textColor = UIColor.coralPink
            checksImageView.image = UIImage(named: "redDot")
        }
        testNameLabel.text = result.name
        requestTypeLabel.text = result.method
        testRunDateView.configure(date: result.getDate(), time: result.getTime())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
