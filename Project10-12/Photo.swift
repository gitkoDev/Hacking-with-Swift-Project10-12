//
//  Photo.swift
//  Project10-12
//
//  Created by Gitko Denis on 11.07.2022.
//

import UIKit

class Photo: NSObject {
    var name: String
    var caption: String
    init(name: String, caption: String) {
        self.name = name
        self.caption = caption
    }
}
