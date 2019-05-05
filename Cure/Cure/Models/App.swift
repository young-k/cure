//
//  App.swift
//  Cure
//
//  Created by Young Kim on 4/15/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import Foundation

enum Status: Int, Codable {
    case green
    case yellow
    case red
}

struct App: Codable {
    var id: Int
    var name: String
    var icon: String
    var numChecksPassed: Int
    var totalChecks: Int
    var updatedAt: Date
    
    func getStatus() -> Status {
        if numChecksPassed == 0 {
            return .red
        } else if numChecksPassed == totalChecks {
            return .green
        } else {
            return .yellow
        }
    }
    
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
