//
//  AddTestHeaderTableViewCell.swift
//  Cure
//
//  Created by Young Kim on 4/18/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import UIKit

class AddTestHeaderTableViewCell: UITableViewCell {
    
    var delegate: AddTestHeaderDelegate!
    var xButton: UIButton!
    
    var testNameLabel: UILabel!
    var testNameTextField: UITextField!
    var testNameLine: UIView!
    
    var urlLabel: UILabel!
    var urlTextField: UITextField!
    var urlLine: UIView!
    
    var methodLabel: UILabel!
    var getButton: MethodButton!
    var getPostSpacer: UIView!
    var postButton: MethodButton!
    var postDeleteSpacer: UIView!
    var deleteButton: MethodButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        xButton = UIButton()
        xButton.setImage(UIImage(named: "x"), for: .normal)
        xButton.addTarget(self, action: #selector(dismissParentVC), for: .touchUpInside)
        self.contentView.addSubview(xButton)
        
        // Test Name
        testNameLabel = UILabel()
        testNameLabel.text = "Test Name"
        testNameLabel.font = UIFont.avenirDemiBold?.withSize(20)
        self.contentView.addSubview(testNameLabel)
        
        testNameTextField = UITextField()
        testNameTextField.placeholder = "Sample Test"
        testNameTextField.font = UIFont.avenirRegular?.withSize(14)
        testNameTextField.textColor = UIColor.cureIndigo
        self.contentView.addSubview(testNameTextField)
        
        testNameLine = UIView()
        testNameLine.backgroundColor = UIColor.shaleGray
        self.contentView.addSubview(testNameLine)
        
        // URL
        urlLabel = UILabel()
        urlLabel.text = "URL"
        urlLabel.font = UIFont.avenirDemiBold?.withSize(20)
        self.contentView.addSubview(urlLabel)
        
        urlTextField = UITextField()
        urlTextField.placeholder = "Sample URL"
        urlTextField.font = UIFont.avenirRegular?.withSize(14)
        urlTextField.textColor = UIColor.cureIndigo
        self.contentView.addSubview(urlTextField)
        
        urlLine = UIView()
        urlLine.backgroundColor = UIColor.shaleGray
        self.contentView.addSubview(urlLine)
        
        // Method
        methodLabel = UILabel()
        methodLabel.text = "Method"
        methodLabel.font = UIFont.avenirDemiBold?.withSize(20)
        self.contentView.addSubview(methodLabel)
        
        getButton = MethodButton(methodButtonType: .get)
        postButton = MethodButton(methodButtonType: .post)
        deleteButton = MethodButton(methodButtonType: .delete)
        getButton.addTarget(self, action: #selector(getRadioButtonToggle), for: .touchUpInside)
        postButton.addTarget(self, action: #selector(postRadioButtonToggle), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deleteRadioButtonToggle), for: .touchUpInside)
        self.contentView.addSubview(getButton)
        self.contentView.addSubview(postButton)
        self.contentView.addSubview(deleteButton)
        
        getPostSpacer = UIView()
        getPostSpacer.backgroundColor = UIColor.lightGray
        getPostSpacer.layer.cornerRadius = 4
        self.contentView.addSubview(getPostSpacer)
        
        postDeleteSpacer = UIView()
        postDeleteSpacer.backgroundColor = UIColor.lightGray
        postDeleteSpacer.layer.cornerRadius = 4
        self.contentView.addSubview(postDeleteSpacer)
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        xButton.snp.makeConstraints { make in
            make.width.height.equalTo(18)
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(35)
        }
        
        testNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(35)
            make.top.equalTo(contentView.snp.top).offset(25)
        }
        testNameTextField.snp.makeConstraints { make in
            make.leading.equalTo(testNameLabel.snp.leading)
            make.top.equalTo(testNameLabel.snp.bottom).offset(5)
        }
        testNameLine.snp.makeConstraints { make in
            make.leading.equalTo(testNameLabel.snp.leading)
            make.trailing.equalToSuperview().inset(35)
            make.height.equalTo(1)
            make.top.equalTo(testNameTextField.snp.bottom).offset(8)
        }
        
        urlLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(35)
            make.top.equalTo(testNameLine.snp.bottom).offset(15)
        }
        urlTextField.snp.makeConstraints { make in
            make.leading.equalTo(urlLabel.snp.leading)
            make.top.equalTo(urlLabel.snp.bottom).offset(5)
        }
        urlLine.snp.makeConstraints { make in
            make.leading.equalTo(testNameLabel.snp.leading)
            make.trailing.equalToSuperview().inset(35)
            make.height.equalTo(1)
            make.top.equalTo(urlTextField.snp.bottom).offset(8)
        }
        
        methodLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(35)
            make.top.equalTo(urlLine.snp.bottom).offset(15)
        }
        getButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(35)
            make.height.equalTo(36)
            make.width.equalTo(95)
            make.top.equalTo(methodLabel.snp.bottom).offset(15)
        }
        getPostSpacer.snp.makeConstraints { make in
            make.width.height.equalTo(8)
            make.leading.equalTo(getButton.snp.trailing).offset(11)
            make.centerY.equalTo(getButton.snp.centerY)
        }
        postButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(36)
            make.width.equalTo(95)
            make.top.equalTo(methodLabel.snp.bottom).offset(15)
        }
        postDeleteSpacer.snp.makeConstraints { make in
            make.width.height.equalTo(8)
            make.leading.equalTo(postButton.snp.trailing).offset(11)
            make.centerY.equalTo(postButton.snp.centerY)
        }
        deleteButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(35)
            make.height.equalTo(36)
            make.width.equalTo(95)
            make.top.equalTo(methodLabel.snp.bottom).offset(15)
        }
    }
    
    @objc func dismissParentVC() {
        delegate.dismissVC()
    }
    
    @objc func getRadioButtonToggle() {
        getButton.isSelected = true
        postButton.isSelected = false
        deleteButton.isSelected = false
        delegate.setMethodType(type: .get)
    }
    
    @objc func postRadioButtonToggle() {
        getButton.isSelected = false
        postButton.isSelected = true
        deleteButton.isSelected = false
        delegate.setMethodType(type: .post)
    }
    
    @objc func deleteRadioButtonToggle() {
        getButton.isSelected = false
        postButton.isSelected = false
        deleteButton.isSelected = true
        delegate.setMethodType(type: .delete)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
