//
//  PhotoListCellViewModel.swift
//  MVVMPlayground
//
//  Created by Keith Gapusan on 19/07/2018.
//  Copyright © 2018 ST.Huang. All rights reserved.
//

import UIKit

class PhotoListCellViewModel: NSObject {
    

    let id: Int
    let name: String
    let desc: String?
    let created_at: Date
    let image_url: String
    let for_sale: Bool
    let camera: String?
    
    
    public init(id: Int,  name_photo: String , description: String?, created_at: Date,image_url: String,for_sale:Bool, camera: String? ) {
        
        self.id = id
        self.name = name_photo
        self.desc = description
        self.created_at = created_at
        self.image_url = image_url
        self.for_sale = for_sale
        self.camera = camera
    }

}

