//
//  ErrorRequestBJ.swift
//  BlackmindJobiOS
//
//  Created by Freddy Silva on 2/12/20.
//  Copyright © 2020 Freddy Silva. All rights reserved.
//

import Foundation

class ErrorRequestBJ: Error {
    
    private(set) var localizedDescription: String
    var code: Int?
    var body: Data?
    
    init(error: Error?, data: Data?, code: Int?) {
        self.localizedDescription = error?.localizedDescription ?? ""
    }
}
