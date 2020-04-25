//
//  ViewController.swift
//  ProxyBayApp
//
//  Created by Prateek Dasari on 23/04/2020.
//  Copyright © 2020 Prateek Dasari. All rights reserved.
//


import UIKit
import AVFoundation

class ViewController: UIViewController {
    
      @IBOutlet private weak var collectionView: UICollectionView!
      @IBOutlet private weak var searchBar: UISearchBar!
    
    var photos = [ResultModel]()
    var networkClient: NetworkClientAdapter = NetworkClient()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
          layout.delegate = self
        }
        collectionView?.backgroundColor = .clear
        searchBarSearchButtonClicked(searchBar)
    }
    
    func getThePhotos(pageCount:Int) {
        
        networkClient.sendRequest(queryString: searchBar.text ?? "", pageCount: pageCount) { [weak self] (response, error) in
            guard let weakSelf = self else {return}
            
            if let models = response as? [ResultModel] {
                
                weakSelf.photos.append(contentsOf: models)
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                    self?.collectionView.layoutIfNeeded()
                }
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == photos.count - 6 {
            getThePhotos(pageCount: ((photos.count/20)+1))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("Row Index -> \(indexPath.item)")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath as IndexPath) as! PhotoCell
        cell.photo = photos[indexPath.item]
        cell.contentView.backgroundColor = .blue
        cell.titleLabel.backgroundColor = .white
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let detailViewController = storyBoard.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        detailViewController.model = photos[indexPath.item]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
}

extension ViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        let height = photos[indexPath.item].previewHeight
        return CGFloat(height*2)
    }
}


extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        photos.removeAll()
        getThePhotos(pageCount: 1)
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.becomeFirstResponder()
    }
}
