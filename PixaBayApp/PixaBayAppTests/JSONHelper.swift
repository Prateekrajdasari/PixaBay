//
//  JSONHelper.swift
//  ProxyBayAppTests
//
//  Created by Prateek Dasari on 24/04/2020.
//  Copyright © 2020 Prateek Dasari. All rights reserved.
//

import Foundation

class JSONHelper {
    
    class func jsonFileToData(jsonName: String) -> Data? {
        if let path = Bundle.main.path(forResource: jsonName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                return nil
            }
        }
        return nil
    }
}
