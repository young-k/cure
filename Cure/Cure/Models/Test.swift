//
//  Test.swift
//  Cure
//
//  Created by Young Kim on 4/30/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import Foundation

struct Test: Codable {
    var id: Int
    var name: String
    var method: String
    var url: String
    var results: [TestResult]
    var updatedAt: Date
    
    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MM.dd.yyyy")
        return formatter.string(from: updatedAt)
    }
    
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("h:mm a")
        return formatter.string(from: updatedAt)
    }
    
}
