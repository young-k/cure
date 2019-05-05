//
//  AddTestParamTableViewCell.swift
//  Cure
//
//  Created by Young Kim on 4/22/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import UIKit

class AddTestParamTableViewCell: UITableViewCell {
    
    var keyLabel: UILabel!
    var valueLabel: UILabel!
    var separatorView: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = UIColor.sleetGray
        
        keyLabel = UILabel()
        keyLabel.font = UIFont.avenirMedium?.withSize(14)
        keyLabel.textColor = UIColor.cureIndigo
        keyLabel.textAlignment = .left
        self.contentView.addSubview(keyLabel)
        
        valueLabel = UILabel()
        valueLabel.font = UIFont.avenirRegular?.withSize(14)
        valueLabel.textColor = UIColor.darkGray
        valueLabel.textAlignment = .right
        self.contentView.addSubview(valueLabel)
        
        separatorView = UIView()
        separatorView.backgroundColor = UIColor.shaleGray
        self.contentView.addSubview(separatorView)
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(key: String, value: String) {
        keyLabel.text = key
        valueLabel.text = value
    }
    
    func setupConstraints() {
        keyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.left.equalToSuperview().offset(37)
            make.height.equalTo(28)
        }
        valueLabel.snp.makeConstraints { make in
            make.top.equalTo(keyLabel.snp.top)
            make.right.equalToSuperview().inset(37)
            make.height.equalTo(keyLabel.snp.height)
        }
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(keyLabel.snp.bottom)
            make.right.left.equalToSuperview().inset(37)
            make.height.equalTo(0.5)
        }
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
