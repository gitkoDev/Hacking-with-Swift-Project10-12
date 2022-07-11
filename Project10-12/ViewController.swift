//
//  ViewController.swift
//  Project10-12
//
//  Created by Gitko Denis on 11.07.2022.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var photos = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPhoto))
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Photo", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = photos[indexPath.row].caption
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = photos[indexPath.row].name
            vc.imageName = photos[indexPath.row].caption

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func addPhoto() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        
        if(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            picker.sourceType = .camera
        }
        
        present(picker, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        dismiss(animated: true)
        
        let ac = UIAlertController(title: "Name your photo", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Submit", style: .default) {_ in
            if let name = ac.textFields?[0].text {
                let photo = Photo(name: imageName, caption: name)
                self.photos.append(photo)
                self.tableView.reloadData()
            } else {
                let photo = Photo(name: imageName, caption: "Unknown")
                self.photos.append(photo)
                self.tableView.reloadData()
            }
        })
        
        present(ac, animated: true)
        

        




    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}

