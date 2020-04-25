//
//  ViewControllerTests.swift
//  PixaBayAppTests
//
//  Created by Prateek Dasari on 25/04/2020.
//  Copyright © 2020 Prateek Dasari. All rights reserved.
//

import Foundation
import Nimble
import Quick

@testable import PixaBayApp

class ViewControllerTests: QuickSpec {
    
    var viewController: ViewController!
    
    override func spec() {
        
        beforeEach {
            self.viewController = ViewController.stub()
        }
        afterEach {
            self.viewController = nil
        }
        
        describe("ViewControllerTests") {
            describe("Positive Case") {
                context("When the app loads and the collection view is loaded") {
                    
                    it("should accept the amount and move to next screen") {
                        expect(self.viewController.photos).toNot(beEmpty())
                    }
                }
            }
            
            
        }
    }
}

