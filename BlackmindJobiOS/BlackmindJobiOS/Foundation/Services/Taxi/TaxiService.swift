//
//  TaxiService.swift
//  BlackmindJobiOS
//
//  Created by Freddy Silva on 2/12/20.
//  Copyright © 2020 Freddy Silva. All rights reserved.
//

import Foundation

class TaxiService {

    private struct EndPoints {
        static let taxiInfo = "test"
    }
    
    func fetchTaxiInfo(completion: @escaping (Swift.Result<TaxiResponse,Error>) -> Void) {
        ConnectionServiceBJ.requestGET(url: EndPoints.taxiInfo) { result in
            let result = result.map { data -> TaxiResponse in
                return (try? JSONDecoder.blackmindJob.decode(TaxiResponse.self, from: data ?? Data())) ?? TaxiResponse()
            }
            completion(result)
        }
    }
}
