//
//  AddTestParamsHeaderTableViewCell.swift
//  Cure
//
//  Created by Young Kim on 4/18/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import UIKit

class AddTestParamsHeaderTableViewCell: UITableViewCell {
    
    var parametersLabel: UILabel!
    var emptyLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = UIColor.sleetGray
        
        parametersLabel = UILabel()
        parametersLabel.textColor = .black
        parametersLabel.font = UIFont.avenirDemiBold?.withSize(20)
        parametersLabel.text = "Parameters"
        self.contentView.addSubview(parametersLabel)
        
        setupConstraints()
    }
    
    func addEmptyState(isEmpty: Bool) {
        
    }
    
    func setupConstraints() {
        parametersLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.leading.equalToSuperview().offset(35)
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
