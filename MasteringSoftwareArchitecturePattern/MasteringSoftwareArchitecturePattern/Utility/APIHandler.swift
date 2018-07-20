//
//  APIHandler.swift
//  MasteringSoftwareArchitecturePattern
//
//  Created by Keith Gapusan on 19/07/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import Foundation

class APIHandler{
    // Simulate a long waiting for fetching
    func fetchPopularPhoto( complete: @escaping ( _ success: Bool, _ photos: [Photo], _ error: Error? )->() ) {
        DispatchQueue.global().async {
            
            let path = Bundle.main.path(forResource: "content", ofType: "json")!
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let photos = try! decoder.decode(Photos.self, from: data)
            complete( true, photos.photos, nil )
        }
    }
}
