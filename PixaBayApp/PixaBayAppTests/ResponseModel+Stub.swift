//
//  ResponseModel+Stub.swift
//  PixaBayAppTests
//
//  Created by Prateek Dasari on 25/04/2020.
//  Copyright © 2020 Prateek Dasari. All rights reserved.
//

import Foundation

extension ResponseModel {
    
    static func stub(with fileName: String) -> ResponseModel? {
        guard let jsonData = JSONHelper.jsonFileToData(jsonName: fileName) else {
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let referencesModel = try decoder.decode(ResponseModel.self, from: jsonData)
            return referencesModel
        } catch {
            return nil
        }
    }
}
