//
//  TaxiCollectionViewCell.swift
//  BlackmindJobiOS
//
//  Created by Freddy Silva on 2/13/20.
//  Copyright © 2020 Freddy Silva. All rights reserved.
//

import UIKit

class TaxiCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var vinLabel: UILabel!
    
    static let reuseIdentifier = "TaxiCellId"
    static let cellHeight: CGFloat = 100
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        settingContainerView()
    }

    var taxi: Taxi? {
        didSet {
            nameLabel.text = taxi?.name
            vinLabel.text = taxi?.vin
        }
    }
    
    private func settingContainerView() {
        containerView.layer.cornerRadius = 5
    }
}
