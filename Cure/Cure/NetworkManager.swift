//
//  NetworkManager.swift
//  Cure
//
//  Created by Young Kim on 4/16/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import Alamofire
import Foundation
import UIKit

class NetworkManager {
    
    private init() {}
    static let shared = NetworkManager()
    
    let allAppsURL = "http://35.185.95.216/api/apps/"
    let allTestsURL = "http://35.185.95.216/api/tests/"
    
    func getImage(url: String, completion: @escaping ((UIImage) -> Void)) {
        Alamofire.request(url).validate().responseData { response in
            switch response.result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    completion(image)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getApps(completion: @escaping (([App]) -> Void)) {
        Alamofire.request(allAppsURL).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .secondsSince1970
                if let response = try? jsonDecoder.decode(AllAppsResponse.self, from: data) {
                    completion(response.data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getTestResults(id: Int, completion: @escaping (([Test]) -> Void)) {
        Alamofire.request(allTestsURL + "\(id)/").validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .secondsSince1970
                if let response = try? jsonDecoder.decode(AllTestsResponse.self, from: data) {
                    completion(response.data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
