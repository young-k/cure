//
//  AddTestFooterTableViewCell.swift
//  Cure
//
//  Created by Young Kim on 4/19/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import UIKit

class AddTestFooterTableViewCell: UITableViewCell {
    
    var keyInputField: UITextField!
    var valueInputField: UITextField!
    
    var addParamButton: UIButton!
    
    var delegate: AddParamsDelegate!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .sleetGray
        
        keyInputField = UITextField()
        keyInputField.placeholder = "key"
        keyInputField.backgroundColor = .white
        keyInputField.layer.cornerRadius = 8
        keyInputField.layer.borderWidth = 0.3
        keyInputField.layer.borderColor = UIColor.shaleGray.cgColor
        keyInputField.font = UIFont.avenirRegular?.withSize(14)
        keyInputField.textColor = UIColor.cureIndigo
        keyInputField.leftViewMode = .always
        keyInputField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: 0))
        contentView.addSubview(keyInputField)
        
        valueInputField = UITextField()
        valueInputField.placeholder = "value"
        valueInputField.backgroundColor = .white
        valueInputField.layer.cornerRadius = 8
        valueInputField.layer.borderWidth = 0.3
        valueInputField.layer.borderColor = UIColor.shaleGray.cgColor
        valueInputField.font = UIFont.avenirRegular?.withSize(14)
        valueInputField.textColor = UIColor.cureIndigo
        valueInputField.leftViewMode = .always
        valueInputField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: 0))
        contentView.addSubview(valueInputField)
        
        addParamButton = UIButton()
        addParamButton.setTitle("Add Parameter", for: .normal)
        addParamButton.setTitleColor(.white, for: .normal)
        addParamButton.titleLabel?.font = UIFont.avenirDemiBold?.withSize(14)
        addParamButton.backgroundColor = .black
        addParamButton.layer.cornerRadius = 20
        addParamButton.addTarget(self, action: #selector(addParam), for: .touchUpInside)
        contentView.addSubview(addParamButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        keyInputField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.trailing.equalToSuperview().inset(35)
            make.height.equalTo(31)
        }
        
        valueInputField.snp.makeConstraints { make in
            make.top.equalTo(keyInputField.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(35)
            make.height.equalTo(31)
        }
        
        addParamButton.snp.makeConstraints { make in
            make.top.equalTo(valueInputField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(160)
            make.height.equalTo(40)
        }
    }
    
    @objc func addParam() {
        if let key = keyInputField.text, let value = valueInputField.text {
            delegate.addParam(key: key, value: value)
            keyInputField.text = ""
            valueInputField.text = ""
        }
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
