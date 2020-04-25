//
//  NetworkClientMock.swift
//  ProxyBayAppTests
//
//  Created by Prateek Dasari on 24/04/2020.
//  Copyright © 2020 Prateek Dasari. All rights reserved.
//

@testable import PixaBayApp
import Foundation

class NetworkClientMock: NetworkClientAdapter {
    var nextJson: Any?
    var nextError: Error?
    
    func sendRequest(queryString:String,
                     pageCount:Int,
                     completionHandler: @escaping CompletionBlock) {
        completionHandler(nextJson, nextError)
    }
}
