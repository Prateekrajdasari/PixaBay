//
//  DetailsViewController.swift
//  PixaBayApp
//
//  Created by Prateek Dasari on 25/04/2020.
//  Copyright © 2020 Prateek Dasari. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var model: ResultModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.downloadFrom(link: model.largeImageURL, activity: activityIndicator)
        likeCountLabel.text = String(model.likes)
        tagsLabel.text = model.tags
        commentsLabel.text = String(model.comments)
    }
    
}
