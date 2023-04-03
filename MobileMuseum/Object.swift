//
//  Object.swift
//  MobileMuseum
//
//  Created by Ryder Claybaugh on 3/10/23.
//

import Foundation

struct Object: Codable {
    let objectID: Int
    let isPublicDomain: Bool
    let primaryImage: String
    let primaryImageSmall: String
    let additionalImages: [String]
    let department: String
    let objectName: String
    let title: String
    let culture: String?
    let artistDisplayName: String?
    let objectDate: String
    let objectBeginDate: Int
    let objectEndDate: Int
    let medium: String
    let dimensions: String
    let measurements: [Measurements]?
    let country: String
    let classification: String
}

struct Measurements: Codable {
    let elementName: String?
    let elementDescription: String?
    let elementMeasurements: ElementMeasurements?
}

struct ElementMeasurements: Codable {
    let height: Int?
    let width: Int?
}
