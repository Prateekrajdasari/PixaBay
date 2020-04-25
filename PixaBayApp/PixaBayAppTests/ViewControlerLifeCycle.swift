//
//  ViewControlerLifeCycle.swift
//  PixaBayAppTests
//
//  Created by Prateek Dasari on 25/04/2020.
//  Copyright © 2020 Prateek Dasari. All rights reserved.
//

@testable import PixaBayApp
import Foundation
import UIKit
extension UIViewController {
    func simulateViewLifeCycle(navigationController: UINavigationController = UINavigationController()) {
        //create window
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()

        navigationController.viewControllers = [self]

        //force view did load
        _ = self.view

        //force view life cycle (view will appear)
        self.beginAppearanceTransition(true, animated: true)
        //viewdidappear
        self.endAppearanceTransition()
    }
}

