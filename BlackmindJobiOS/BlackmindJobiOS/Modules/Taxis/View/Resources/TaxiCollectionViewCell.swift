//
//  TaxiCollectionViewCell.swift
//  BlackmindJobiOS
//
//  Created by Freddy Silva on 2/13/20.
//  Copyright © 2020 Freddy Silva. All rights reserved.
//

import UIKit

class TaxiCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var vinLabel: UILabel!
    
    static let reuseIdentifier = "TaxiCellId"
    static let cellHeight: CGFloat = 80

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    var taxi: Taxi? {
        didSet {
            nameLabel.text = taxi?.name
            vinLabel.text = taxi?.vin
        }
    }
}
