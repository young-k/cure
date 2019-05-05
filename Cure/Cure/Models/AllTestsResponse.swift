//
//  AllTestsResponse.swift
//  Cure
//
//  Created by Young Kim on 4/30/19.
//  Copyright © 2019 Young Kim. All rights reserved.
//

import Foundation

struct AllTestsResponse: Codable {
    var success: Bool
    var data: [Test]
}
