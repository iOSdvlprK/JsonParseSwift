//
//  ViewController.swift
//  JsonParseSwift
//
//  Created by joe on 2023/01/01.
//

import UIKit

struct WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
    
    enum CodingKeys: String, CodingKey {
        case name
        case description = "dDescription"
        case courses
    }
}

//struct Course: Decodable {
//    let id: Int
//    let name: String
//    let link: String
//    let imageUrl: String
//
//    // Swift 2/3/Obj-C
////    init(json: [String: Any]) {
////        id = json["id"] as? Int ?? -1
////        name = json["name"] as? String ?? ""
////        link = json["link"] as? String ?? ""
////        imageUrl = json["imageUrl"] as? String ?? ""
////    }
//}

struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
//        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
//        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, err in
            // perhaps check err
            // also perhaps check response status 200 OK
            
            guard let data = data else { return }
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString ?? "")
            
            do {
                // Swift 2/3/Obj-C
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
//                let course = Course(json: json)
//                print(course.name)
                
//                let course = try JSONDecoder().decode(Course.self, from: data)
//                print(course.name)
//
//                let courses = try JSONDecoder().decode([Course].self, from: data)
//                print(courses)
                
//                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
//                print(websiteDescription.name, websiteDescription.description)
                
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }


}

