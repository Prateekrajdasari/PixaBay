//
//  PhotoCell.swift
//  ProxyBayApp
//
//  Created by Prateek Dasari on 23/04/2020.
//  Copyright © 2020 Prateek Dasari. All rights reserved.
//


import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var photo: ResultModel? {
        didSet {
            if let photo = photo {
                imageView.image = UIImage(named: "default")
                imageView.downloadFrom(link: photo.largeImageURL, activity: activityIndicator)
                titleLabel.text = photo.user
            }
        }
    }
}


extension UIImageView {
    func downloadFrom(link:String?, activity: UIActivityIndicatorView) {
        activity.startAnimating()
        guard let link = link else {
            self.image = UIImage(named: "default")
            return
        }
        
        if let url = URL(string: link) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) -> Void in
                guard let data = data, error == nil else {
                    return
                }
                
                DispatchQueue.main.async { [weak self] in
                    guard let weakSelf = self else { return }
                    weakSelf.image = UIImage(data: data)
                    activity.stopAnimating()
                    weakSelf.layoutSubviews()
                }
            }).resume()
        }
        else
        {
            self.image = UIImage(named: "default")
        }
    }
}
