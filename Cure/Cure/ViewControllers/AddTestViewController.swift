//
//  AddTestViewController.swift
//  Cure
//
//  Created by Young Kim on 4/17/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import UIKit

protocol AddTestHeaderDelegate: class {
    func dismissVC()
    func setMethodType(type: MethodButtonType)
}

protocol AddParamsDelegate: class {
    func addParam(key: String, value: String)
}

class AddTestViewController: UIViewController {
    
    var params: [String: String]!
    
    var headerReuseIdentifier = "headerCell"
    var paramsHeaderReuseIdentifier = "paramsHeaderCell"
    var paramsReuseIdentifier = "paramsCell"
    var footerReuseIdenitifer = "footerCell"
    
    var tableView: UITableView!
    var addTestButton: UIButton!
    var addTestButtonLabel: UILabel!
    var footerView: UIView!
    
    var methodType: String!
    var appName: String!
    
    init(appName: String) {
        super.init(nibName: nil, bundle: nil)
        self.appName = appName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        params = [:]
        
        addTestButton = UIButton()
        addTestButton.backgroundColor = UIColor.cureIndigo
        view.addSubview(addTestButton)
        
        addTestButtonLabel = UILabel()
        addTestButtonLabel.text = "Add Test to \(appName ?? "App")"
        addTestButtonLabel.textColor = .white
        addTestButtonLabel.font = UIFont.avenirDemiBold?.withSize(20)
        view.addSubview(addTestButtonLabel)
        
        tableView = UITableView()
        tableView.backgroundColor = UIColor.sleetGray
        tableView.register(AddTestHeaderTableViewCell.self, forCellReuseIdentifier: headerReuseIdentifier)
        tableView.register(AddTestParamsHeaderTableViewCell.self, forCellReuseIdentifier: paramsHeaderReuseIdentifier)
        tableView.register(AddTestParamTableViewCell.self, forCellReuseIdentifier: paramsReuseIdentifier)
        tableView.register(AddTestFooterTableViewCell.self, forCellReuseIdentifier: footerReuseIdenitifer)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.width.centerX.equalToSuperview()
            make.bottom.equalTo(addTestButton.snp.top)
        }
        
        addTestButton.snp.makeConstraints { make in
            make.width.bottom.centerX.equalToSuperview()
            make.height.equalTo(88)
        }
        
        addTestButtonLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(35)
            make.top.equalTo(addTestButton.snp.top).offset(20)
        }
    }
    
}

extension AddTestViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 + params.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: headerReuseIdentifier, for: indexPath) as! AddTestHeaderTableViewCell
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: paramsHeaderReuseIdentifier, for: indexPath) as! AddTestParamsHeaderTableViewCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row < params.count + 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: paramsReuseIdentifier, for: indexPath) as! AddTestParamTableViewCell
            let paramsList = params.map { [$0, $1] }
            let currentParam = paramsList[indexPath.row - 2]
            
            cell.selectionStyle = .none
            cell.configure(key: currentParam[0], value: currentParam[1])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: footerReuseIdenitifer, for: indexPath) as! AddTestFooterTableViewCell
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        }
    }
    
}

extension AddTestViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 276
        } else if indexPath.row == 1 {
            return 63
        } else if indexPath.row < 2 + params.count {
            return 40
        } else {
            return 260
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
}

extension AddTestViewController: AddTestHeaderDelegate {
    
    func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    
    func setMethodType(type: MethodButtonType) {
        switch type {
        case .get:
            methodType = "GET"
        case .post:
            methodType = "POST"
        case .delete:
            methodType = "DELETE"
        }
    }
    
}

extension AddTestViewController: AddParamsDelegate {
    func addParam(key: String, value: String) {
        params[key] = value
        tableView.reloadData()
    }
}
