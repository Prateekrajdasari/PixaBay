//
//  NetworkClientAdapter.swift
//  ProxyBayApp
//
//  Created by Prateek Dasari on 24/04/2020.
//  Copyright © 2020 Prateek Dasari. All rights reserved.
//

import Foundation

typealias CompletionBlock = (_ response: Any?, _ error: Error?) -> Void

protocol NetworkClientAdapter {
    
    func sendRequest(queryString:String,
                     pageCount: Int,
                     completionHandler: @escaping CompletionBlock)
    
}
