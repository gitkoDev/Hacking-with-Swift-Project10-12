//
//  Photo.swift
//  Project10-12
//
//  Created by Gitko Denis on 11.07.2022.
//

import UIKit

class Photo: NSObject, NSCoding {
    var name: String
    var caption: String
    init(name: String, caption: String) {
        self.name = name
        self.caption = caption
    }
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        caption = aDecoder.decodeObject(forKey: "caption") as? String ?? ""
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(caption, forKey: "caption")
    }
}
