//
//  NetworkClientAdapter.swift
//  ProxyBayApp
//
//  Created by Prateek Dasari on 24/04/2020.
//  Copyright © 2020 Prateek Dasari. All rights reserved.
//

import Foundation


let API_KEY = "16184847-94d7f1f31284f440560c10e8f"
let queryKey = "q"
let pageKey = "page"
let batchKey = "per_page"

let endpoint = URL(string: "https://pixabay.com/api/")

struct ResultModel: Codable {
    
    var id: Int
    var largeImageURL: String
    var tags: String
    var user: String
    var likes:Int
    var comments:Int
    var previewHeight:Int
}

struct ResponseModel: Codable {
    var total: Int
    var totalHits: Int
    var hits: [ResultModel]
}


typealias CompletionBlock = (_ response: Any?, _ error: Error?) -> Void

protocol NetworkClientAdapter {
    
    func sendRequest(queryString:String,
                     pageCount: Int,
                     completionHandler: @escaping CompletionBlock)
    
}
