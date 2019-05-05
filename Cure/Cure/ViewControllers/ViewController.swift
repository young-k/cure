//
//  ViewController.swift
//  Cure
//
//  Created by Young Kim on 4/15/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var searchBar: UISearchBar!
    var tableView: UITableView!
    var footerImageView: UIImageView!
    
    var apps: [App]! = []
    var filteredApps: [App]! = []
    
    let cellHeight: CGFloat = 110
    let reuseIdentifier = "appReuseIdentifier"

    override func viewDidLoad() {
        title = "Cure"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.avenirRegular?.withSize(20) as Any]
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        super.viewDidLoad()
        
        self.fetchApps()
        
        searchBar = UISearchBar()
        searchBar.backgroundColor = UIColor.searchBarGray
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        searchBar.enablesReturnKeyAutomatically = false
        view.addSubview(searchBar)
        
        tableView = UITableView()
        tableView.register(AppTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        footerImageView = UIImageView()
        footerImageView.image = UIImage(named: "designWavesShort")
        view.addSubview(footerImageView)
        
        setupConstraints()
    }

    func setupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.width.equalToSuperview()
            make.height.equalTo(60)
        }
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.equalTo(view.snp.bottom)
        }
        footerImageView.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.bottom.width.centerX.equalToSuperview()
        }
    }

    func fetchApps() {
        NetworkManager.shared.getApps { result in
            self.apps = result
            self.filteredApps = self.apps
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filteredApps = apps
        } else {
            filteredApps = apps.filter { app in
                return app.name.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredApps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! AppTableViewCell
        cell.selectionStyle = .none
        let app = filteredApps[indexPath.row]
        print("section: \(indexPath.section), row: \(indexPath.row)")
        cell.configure(for: app)
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
        
        let appViewController = AppViewController(navbarTitle: filteredApps[indexPath.row].name, appId: filteredApps[indexPath.row].id)
        navigationController?.pushViewController(appViewController, animated: true)
    }
    
}
