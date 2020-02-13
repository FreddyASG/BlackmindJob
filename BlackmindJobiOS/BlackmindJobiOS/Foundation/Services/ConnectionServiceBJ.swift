//
//  ConnectionServiceBJ.swift
//  BlackmindJobiOS
//
//  Created by Freddy Silva on 2/12/20.
//  Copyright © 2020 Freddy Silva. All rights reserved.
//

import Foundation
import Alamofire

class ConnectionServiceBJ: NSObject {
    
    typealias CompletionBlock = (Swift.Result<Data?,Error>) -> ()
    
    //MARK: Static functions
    
    static func requestGET(url: String, parameters: [String: Any]? = nil, timeout: TimeInterval = 30, completion: @escaping CompletionBlock) {
        request(url: url, method: .get, parameters: parameters, timeout: timeout, completion: completion)
    }
    
    static func requestPOST(url: String, parameters: [String: Any]? = nil, timeout: TimeInterval = 30, completion: @escaping CompletionBlock) {
        request(url: url, method: .post, parameters: parameters, timeout: timeout, completion: completion)
    }
    
    static func requestPUT(url: String, parameters: [String: Any]? = nil, timeout: TimeInterval = 30, completion: @escaping CompletionBlock) {
        request(url: url, method: .put, parameters: parameters, timeout: timeout, completion: completion)
    }
    
    static func requestDELETE(url: String, parameters: [String: Any]? = nil, timeout: TimeInterval = 30, completion: @escaping CompletionBlock) {
        request(url: url, method: .delete, parameters: parameters, timeout: timeout, completion: completion)
    }
}

private extension ConnectionServiceBJ {
    static func buildUrl(withPath path: String) -> String {
        return ConstantsBJ.Url.base + path
    }
    
    static func request(url: String, method: HTTPMethod, parameters: [String: Any]?, timeout: TimeInterval, completion: @escaping CompletionBlock) {
        // let headers = getHeaders() // Enable this when the headers are clearly defined.
        showActivityIndicator(true)
        
        Session.default.sessionConfiguration.timeoutIntervalForRequest = timeout
        Session.default.sessionConfiguration.timeoutIntervalForResource = timeout
        
        AF.request(buildUrl(withPath: url), method: method, parameters: parameters, encoding: JSONEncoding.default , headers: [:]).responseJSON { response in
            showActivityIndicator(false)
            let statusCode = response.response?.statusCode ?? 404
            let isError = statusCode >= 300 || response.error != nil
            if isError {
                let result: Swift.Result<Data?,Error> = .failure(ErrorRequestBJ(error: response.error, data: response.data, code: response.response?.statusCode))
                completion(result)
            } else {
                let result: Swift.Result<Data?,Error> = .success(response.data)
                completion(result)
            }
        }
    }
    
    static func showActivityIndicator(_ show: Bool) {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = show
        }
    }
}
