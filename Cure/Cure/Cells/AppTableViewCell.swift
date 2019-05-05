//
//  AppTableViewCell.swift
//  Cure
//
//  Created by Young Kim on 4/15/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {
    
    var iconImageView: UIImageView!
    var shadowIconImageView: UIView!
    
    var appNameLabel: UILabel!
    
    var checksLabel: UILabel!
    var checksImageView: UIImageView!
    
    var lastCheckedImageView: UIImageView!
    var lastCheckedDateView: DateView!
    
    var statusImageView: UIImageView!
    var rightArrowImageView: UIImageView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = 16
        
        shadowIconImageView = UIView()
        shadowIconImageView.backgroundColor = .clear
        
        shadowIconImageView.layer.shadowColor = UIColor.lightGray.cgColor
        shadowIconImageView.layer.shadowOffset = CGSize(width: 0, height: 4)
        shadowIconImageView.layer.shadowOpacity = 1
        shadowIconImageView.layer.shadowRadius = 4
        
        shadowIconImageView.addSubview(iconImageView)
        self.contentView.addSubview(shadowIconImageView)
        
        appNameLabel = UILabel()
        appNameLabel.font = UIFont.avenirMedium?.withSize(22)
        self.contentView.addSubview(appNameLabel)
        
        // Checks Stuff
        checksLabel = UILabel()
        checksLabel.font = UIFont.avenirRegular?.withSize(14)
        checksLabel.textColor = UIColor.darkGray
        self.contentView.addSubview(checksLabel)
        
        checksImageView = UIImageView()
        checksImageView.contentMode = .scaleAspectFit
        self.contentView.addSubview(checksImageView)
        
        // Last Checked Stuff
        lastCheckedImageView = UIImageView()
        lastCheckedImageView.image = UIImage(named: "clockIcon")
        lastCheckedImageView.contentMode = .scaleAspectFit
        self.contentView.addSubview(lastCheckedImageView)
        
        lastCheckedDateView = DateView()
        self.contentView.addSubview(lastCheckedDateView)
        
        // Right side of cell
        statusImageView = UIImageView()
        statusImageView.contentMode = .scaleAspectFit
        self.contentView.addSubview(statusImageView)
        
        rightArrowImageView = UIImageView()
        rightArrowImageView.image = UIImage(named: "lightGrayArrow")
        rightArrowImageView.contentMode = .scaleAspectFit
        self.contentView.addSubview(rightArrowImageView)

        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        shadowIconImageView.snp.makeConstraints { make in
            make.width.height.equalTo(56)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        appNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(18)
            make.leading.equalTo(iconImageView.snp.trailing).offset(24)
        }
        
        checksImageView.snp.makeConstraints { make in
            make.width.height.equalTo(10)
            make.centerY.equalTo(checksLabel.snp.centerY)
            make.leading.equalTo(appNameLabel.snp.leading)
        }
        
        checksLabel.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(2)
            make.leading.equalTo(checksImageView.snp.trailing).offset(4)
        }
        
        lastCheckedImageView.snp.makeConstraints { make in
            make.width.height.equalTo(10)
            make.centerY.equalTo(lastCheckedDateView.snp.centerY)
            make.leading.equalTo(appNameLabel.snp.leading)
        }
        
        lastCheckedDateView.snp.makeConstraints { make in
            make.top.equalTo(checksLabel.snp.bottom).offset(1)
            make.leading.equalTo(lastCheckedImageView.snp.trailing).offset(4)
            make.height.equalTo(19)
        }
        
        statusImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(32)
            make.trailing.equalTo(rightArrowImageView).inset(15)
        }
        
        rightArrowImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(8)
            make.height.equalTo(14)
            make.trailing.equalToSuperview().inset(20)
        }
    }
    
    func configure(for app: App) {
        appNameLabel.text = app.name
        checksLabel.text = "checks passed: \(app.numChecksPassed)/\(app.totalChecks)"
        lastCheckedDateView.configure(date: app.getDate(), time: app.getTime())
        
        switch (app.getStatus()) {
        case .green:
            checksImageView.image = UIImage(named: "greenDot")
            statusImageView.image = UIImage(named: "checkPassed")
        case .yellow:
            checksImageView.image = UIImage(named: "yellowDot")
            statusImageView.image = UIImage(named: "checkCaution")
        case .red:
            checksImageView.image = UIImage(named: "redDot")
            statusImageView.image = UIImage(named: "checkFailed")
        }
        
        NetworkManager.shared.getImage(url: app.icon, completion: { image in
            self.iconImageView.image = image
        })
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
