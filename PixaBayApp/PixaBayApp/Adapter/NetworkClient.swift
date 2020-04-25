//
//  NetworkClient.swift
//  ProxyBayApp
//
//  Created by Prateek Dasari on 24/04/2020.
//  Copyright © 2020 Prateek Dasari. All rights reserved.
//

import Foundation

class NetworkClient: NetworkClientAdapter {
    
    func sendRequest(queryString:String,
                     pageCount:Int = 1,
                     completionHandler: @escaping CompletionBlock) {
        
        let queryParams = ["key" : API_KEY,
                           queryKey: queryString,
                           pageKey:String(pageCount),
                           batchKey:"20"]
        
        guard let url = endpoint else {return}
        
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return }
        
        components.queryItems = queryParams.map{ URLQueryItem(name: $0.key, value: $0.value) }
        
        guard  let finalURL = components.url else { return }

        var urlRequest = URLRequest(url: finalURL)
        urlRequest.httpMethod = "GET"
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>> \(urlRequest.url?.absoluteString)")
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completionHandler(nil, error)
                    return
                }
                
                guard let responseData = data else {
                    completionHandler(data,error)
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let responseModel = try decoder.decode(ResponseModel.self, from: responseData)
                    let models = responseModel.hits
                    completionHandler(models, nil)
                } catch {
                    completionHandler(nil, nil)
                }
                
            }
        }
        task.resume()
        
        completionHandler(nil,nil)
    }
}
