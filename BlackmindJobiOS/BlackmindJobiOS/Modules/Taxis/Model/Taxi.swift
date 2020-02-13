//
//  Taxi.swift
//  BlackmindJobiOS
//
//  Created by Freddy Silva on 2/12/20.
//  Copyright © 2020 Freddy Silva. All rights reserved.
//

import Foundation

class Taxi: Decodable, Encodable {
    var address: String?
    var coordinates: [Double]?
    var engineType: String?
    var exterior: String?
    var fuel: Int?
    var interior: String?
    var name: String?
    var vin: String?
    
    var latitude: Double {
        guard let latitude = coordinates?[1] else { return 0 }
        return latitude
    }
    
    var longitude: Double {
        guard let longitude = coordinates?[0] else { return 0 }
        return longitude
    }
}
