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

//struct Object {
//    let objectID: Int
//    let isHightlight: Bool
//    let accessionNumber: String
//    let accessionYear: String
//    let isPublicDomain: Bool
//    let primaryImage: String
//    let primaryImageSmall: String
//    let additionalImages: [String]
//    let constituents: [String]
//    let department: String
//    let objectName: String
//    let title: String
//    let culture: String
//    let period: String
//    let dynasty: String
//    let reign: String
//    let portfolio: String
//    let artistRole: String
//    let artistPrefix: String
//    let artistDisplayName: String
//    let artistDisplayBio: String
//    let artistSuffix: String
//    let artistAlphaSort: String
//    let artistNationality: String
//    let artistBeginDate: String
//    let artistEndDate: String
//    let artistGender: String
//    let artistWikidata_URL: String
//    let artistULAN_URL: String
//    let objectDate: String
//    let objectBeginDate: Int
//    let objectEndDate: Int
//    let medium: String
//    let dimensions: String
//    let dimensionsParsed: Float
//    let measurements: [String]
//    let creditLine: String
//    let geographyType: String
//    let city: String
//    let state: String
//    let county: String
//    let country: String
//    let region: String
//    let subregion: String
//    let locale: String
//    let locus: String
//    let excavation: String
//    let river: String
//    let classification: String
//    let rightsAndReproduction: String
//    let linkResource: String
//    let metadataDate: Date
//    let repository: String
//    let objectURL: String
//    let tags: [String]
//    let objectWikidata_URL: String
//    let isTimelineWork: String
//    let GalleryNumber: String
//}
