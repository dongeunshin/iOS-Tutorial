//
//  PhotosViewController.swift
//  Photorama
//
//  Created by dong eun shin on 4/18/25.
//

import UIKit
class PhotosViewController: UIViewController {
    var store: PhotoStore!
    @IBOutlet private var imageView: UIImageView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        store.fetchInterestingPhotos { (photosResult) in
            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos.")
                if let firstPhoto = photos.first {
                    self.updateImageView(for: firstPhoto)
                }
            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
            }
        }
    }
    
    
    func updateImageView(for photo: Photo) {
        store.fetchImage(for: photo) { (imageResult) in
            switch imageResult {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error downloading image: \(error)")
            }
        }
    }
}
