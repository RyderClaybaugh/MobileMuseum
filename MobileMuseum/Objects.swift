//
//  Object.swift
//  MobileMuseum
//
//  Created by Ryder Claybaugh on 3/10/23.
//

import Foundation

struct Objects: Codable, Identifiable {
    var total: Int
    var id: [Int]
    
    enum CodingKeys: String, CodingKey {
        case total
        case id = "objectIDs"
    }
}
