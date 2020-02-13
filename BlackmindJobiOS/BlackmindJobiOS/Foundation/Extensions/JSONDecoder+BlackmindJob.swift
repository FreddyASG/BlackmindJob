//
//  JSONDecoder+BlackmindJob.swift
//  BlackmindJobiOS
//
//  Created by Freddy Silva on 2/12/20.
//  Copyright © 2020 Freddy Silva. All rights reserved.
//

import Foundation

extension JSONDecoder {
    static let blackmindJob: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
