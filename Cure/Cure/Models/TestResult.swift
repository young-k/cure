//
//  TestResult.swift
//  Cure
//
//  Created by Young Kim on 4/30/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import Foundation

struct ProcessedTestResult {
    var id: Int
    var success: Bool
    var name: String
    var url: String
    var method: String
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

struct TestResult: Codable {
    var id: Int
    var success: Bool
    var updatedAt: Date
}
