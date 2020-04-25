//
//  ViewController+Stub.swift
//  PixaBayAppTests
//
//  Created by Prateek Dasari on 25/04/2020.
//  Copyright © 2020 Prateek Dasari. All rights reserved.
//

@testable import PixaBayApp
import Foundation
import UIKit

extension ViewController {
    
    static func stub() -> ViewController {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyBoard.instantiateViewController(identifier: "ViewController") as! ViewController
        let response = ResponseModel.stub(with: "Apple")
        let networkClient = NetworkClientMock()
        networkClient.nextJson = response?.hits
        networkClient.nextError = nil
        viewController.networkClient = networkClient as NetworkClientAdapter
        viewController.simulateViewLifeCycle()
        return viewController
    }
}
