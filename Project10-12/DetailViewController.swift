//
//  DetailViewController.swift
//  Project10-12
//
//  Created by Gitko Denis on 11.07.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String!
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = imageName
        
        if let imageToLoad = selectedImage {
            let path = getDocumentsDirectory().appendingPathComponent(imageToLoad)
            imageView.image = UIImage(contentsOfFile: path.path)

        }
    }
    

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

}
