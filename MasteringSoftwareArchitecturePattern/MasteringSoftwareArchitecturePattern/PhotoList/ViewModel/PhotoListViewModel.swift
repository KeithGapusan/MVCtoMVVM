//
//  PhotoListViewModel.swift
//  MVVMPlayground
//
//  Created by Keith Gapusan on 19/07/2018.
//  Copyright © 2018 ST.Huang. All rights reserved.
//

import UIKit 

class PhotoListViewModel: NSObject {
    
    var photos: [Photo]?
    var photoCellViewModel : [PhotoListCellViewModel]?
    
    func getPhotoList(completion : @escaping() -> ()){
        APIHandler().fetchPopularPhoto { [weak self] (success, photos, error) in
            DispatchQueue.main.async {
                self?.photos = photos
//                var vms = [PhotoListCellViewModel]()
//                for photo in photos {
//                    vms.append( createCellViewModel(photo: photo) )
//                }
//                self?.photoCellViewModel = vms
                completion()
                //animate table view
            }
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int{
        return photos?.count ?? 0
    }
    
    func getCurrentObject(atIndex: Int) -> Photo{
        return (self.photos![atIndex] ?? nil)!
    }
    
}


//fileprivate func configureCell(_ indexPath: IndexPath, _ cell: PhotoListTableViewCell) {
//    let photo = self.photos[indexPath.row]
//    //Text
//    cell.nameLabel.text = photo.name
//
//    //Wrap a description
//    var descText: [String] = [String]()
//    if let camera = photo.camera {
//        descText.append(camera)
//    }
//    if let description = photo.description {
//        descText.append( description )
//    }
//    cell.descriptionLabel.text = descText.joined(separator: " - ")
//
//    //Wrap the date
//    let dateFormateer = DateFormatter()
//    dateFormateer.dateFormat = "yyyy-MM-dd"
//    cell.dateLabel.text = dateFormateer.string(from: photo.created_at)
//
//    //Image
//    cell.mainImageView.sd_setImage(with: URL(string: photo.image_url), completed: nil)
//}

