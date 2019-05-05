//
//  AppViewController.swift
//  Cure
//
//  Created by Young Kim on 4/23/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {
    
    var navbarTitle: String!
    var appId: Int!
    
    var serverStatusLabel: UILabel!
    var serverStatusImage: UIImageView!
    
    var graphTopLine: UIView!
    var graphMiddleLine: UIView!
    var graphBottomLine: UIView!
    
    var addTestButton: UIButton!
    var runTestsButton: UIButton!
    
    var appTableHeaderView: AppTableHeaderView!
    var tableView: UITableView!
    
    var testResults: [ProcessedTestResult]!
    let cellHeight: CGFloat = 90
    
    let reuseIdentifier = "appCellReuseIdentifier"
    let cellSpacingHeight: CGFloat = 16
    
    init(navbarTitle: String, appId: Int) {
        super.init(nibName: nil, bundle: nil)
        self.navbarTitle = navbarTitle
        self.appId = appId
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backArrow"), style: .done, target: self, action: #selector(goBack))
        self.navigationItem.leftBarButtonItem?.title = ""
        
        self.title = navbarTitle
        view.backgroundColor = .sleetGray
        
        testResults = []
        fetchTestResults()
        
        serverStatusLabel = UILabel()
        serverStatusLabel.text = "Server Status"
        serverStatusLabel.textColor = .black
        serverStatusLabel.font = UIFont.avenirMedium?.withSize(13.5)
        view.addSubview(serverStatusLabel)
        
        serverStatusImage = UIImageView()
        serverStatusImage.image = UIImage(named: "iconOnline")
        view.addSubview(serverStatusImage)
        
        graphTopLine = UIView()
        graphTopLine.backgroundColor = UIColor.sleetGray
        view.addSubview(graphTopLine)
        graphMiddleLine = UIView()
        graphMiddleLine.backgroundColor = UIColor.sleetGray
        view.addSubview(graphMiddleLine)
        graphBottomLine = UIView()
        graphBottomLine.backgroundColor = UIColor.sleetGray
        view.addSubview(graphBottomLine)
        
        addTestButton = UIButton()
        addTestButton.layer.cornerRadius = 20
        addTestButton.backgroundColor = UIColor.cureIndigo
        addTestButton.setTitleColor(.white, for: .normal)
        addTestButton.setTitle("Add Test", for: .normal)
        addTestButton.titleLabel?.font = UIFont.avenirBold?.withSize(14)
        addTestButton.addTarget(self, action: #selector(pressAddTest), for: .touchUpInside)
        view.addSubview(addTestButton)
        
        runTestsButton = UIButton()
        runTestsButton.layer.cornerRadius = 20
        runTestsButton.backgroundColor = .black
        runTestsButton.setTitle("Run Tests", for: .normal)
        runTestsButton.titleLabel?.font = UIFont.avenirBold?.withSize(14)
        runTestsButton.setTitleColor(.white, for: .normal)
        view.addSubview(runTestsButton)
        
        appTableHeaderView = AppTableHeaderView()
        view.addSubview(appTableHeaderView)
        
        tableView = UITableView()
        tableView.backgroundColor = UIColor.sleetGray
        tableView.register(AppTestTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        serverStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(18)
            make.leading.equalToSuperview().offset(35)
        }
        
        serverStatusImage.snp.makeConstraints { make in
            make.centerY.equalTo(serverStatusLabel.snp.centerY)
            make.leading.equalTo(serverStatusLabel.snp.trailing).offset(0.5)
        }
        
        addTestButton.snp.makeConstraints { make in
            make.top.equalTo(serverStatusLabel.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(50)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        
        runTestsButton.snp.makeConstraints { make in
            make.top.equalTo(addTestButton.snp.top).offset(24)
            make.trailing.equalToSuperview().inset(50)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        
        appTableHeaderView.snp.makeConstraints { make in
            make.top.equalTo(addTestButton.snp.bottom).offset(25)
            make.height.equalTo(37)
            make.width.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(appTableHeaderView.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func fetchTestResults() {
        NetworkManager.shared.getTestResults(id: appId, completion: { tests in
            self.testResults = []
            for test in tests {
                for result in test.results {
                    self.testResults.append(ProcessedTestResult.init(id: result.id, success: result.success, name: test.name, url: test.url, method: test.method, updatedAt: result.updatedAt))
                }
            }
            self.testResults.sort(by: { $0.updatedAt > $1.updatedAt })
            self.tableView.reloadData()
        })
    }
    
    @objc func pressAddTest() {
        let addTestViewController = AddTestViewController()
        present(addTestViewController, animated: true, completion: nil)
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }

}

extension AppViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return testResults.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
}

extension AppViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! AppTestTableViewCell
        cell.configure(for: testResults[indexPath.section])
        cell.selectionStyle = .none
        print("section: \(indexPath.section), row: \(indexPath.row)")
        return cell
    }
    
}
