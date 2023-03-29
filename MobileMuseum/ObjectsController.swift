//
//  ObjectsController.swift
//  MobileMuseum
//
//  Created by Ryder Claybaugh on 3/10/23.
//

import Foundation

func fetchObjects(searchTerm: String, departmentId: String, geolocation: String, beginDate: String, endDate: String, completion: @escaping (Result<Objects, Error>) -> Void) {
    var departmentLink = ""
    var geolocationLink = ""
    var beginDateAndEndDateLink = ""
    
    if departmentId == "Unspecified" {
        departmentLink = ""
    } else {
        departmentLink = "&departmentId=\(departmentId)"
    }
    if geolocation == "Unspecified" {
        geolocationLink = ""
    } else {
        geolocationLink = "&geoLocation=\(geolocation)"
    }
    if beginDate == "Unspecified" && endDate == "Unspecified" {
        beginDateAndEndDateLink = ""
    } else {
        beginDateAndEndDateLink = "&dateBegin=\(beginDate)&dateEnd=\(endDate)"
    }
    
    guard let url = URL(string: "https://collectionapi.metmuseum.org/public/collection/v1/search?hasImages=true&\(departmentLink)\(geolocationLink)\(beginDateAndEndDateLink)&q=\(searchTerm)") else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            print(error)
            return
        }
        guard let data = data else {
            completion(.failure(NSError(domain: "No data returned", code: 0, userInfo: nil)))
            print(data as Any)
            return
        }
        do {
                let decoder = JSONDecoder()
                let objects = try decoder.decode(Objects.self, from: data)
                completion(.success(objects))
            } catch {
                completion(.failure(error))
            }
    }.resume()
}

func getObjectInfo(objectId: Int, completion: @escaping (Result<Object, Error>) -> Void) {
    let url = URL(string: "https://collectionapi.metmuseum.org/public/collection/v1/objects/\(objectId)")!

    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            print(error)
            return
        }
    
    guard let data = data else {
        completion(.failure(NSError(domain: "No data returned", code: 0, userInfo: nil)))
        print(data as Any)
        return
    }

        do {
            let decoder = JSONDecoder()
            let object = try decoder.decode(Object.self, from: data)
            completion(.success(object))
        } catch {
            completion(.failure(error))
        }
    }.resume()
}

//enum ImageError: Error, LocalizedError {
//    case itemNotFound
//    case imageDataMissing
//}
//
//func fetchImage(from url: URL) async throws -> Image {
//    var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
//    urlComponents?.scheme = "https"
//    
//    let (data, response) = try await URLSession.shared.data(from: urlComponents!.url!)
//    
//    guard let httpResponse = response as? HTTPURLResponse,
//          httpResponse.statusCode == 200 else {
//        throw ImageError.imageDataMissing
//    }
//    
//    guard let image = UIImage(data: data) else {
//        throw ImageError.imageDataMissing
//    }
//    print("fetched image")
//    return image
//}

