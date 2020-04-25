//
//  PhotoCell.swift
//  ProxyBayApp
//
//  Created by Prateek Dasari on 23/04/2020.
//  Copyright © 2020 Prateek Dasari. All rights reserved.
//

import Foundation
import UIKit

struct Photo {
  var caption: String
  var image: UIImage
  
  init(caption: String, image: UIImage) {
    self.caption = caption
    self.image = image
  }
  
  static func allPhotos() -> [Photo] {
    var photos: [Photo] = []
    guard
      let URL = Bundle.main.url(forResource: "Photos", withExtension: "plist"),
      let photosFromPlist = NSArray(contentsOf: URL) as? [[String: String]]
      else {
        return photos
    }
    for dictionary in photosFromPlist {
        if let caption = dictionary["Caption"], let photo = dictionary["Photo"] {
            photos.append(Photo(caption: caption, image: UIImage(named: photo) ?? UIImage()))
      }
    }
    return photos
  }
    
    static func getImgesFromServer(with queryString: String) {
        
    }
}

