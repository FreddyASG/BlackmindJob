//
//  DetailTaxiViewModel.swift
//  BlackmindJobiOS
//
//  Created by Freddy Silva on 2/13/20.
//  Copyright © 2020 Freddy Silva. All rights reserved.
//

import Foundation

protocol DetailTaxiViewProtocol: class {
    var delegate: DetailTaxiViewControllerProtocol? { get set }
    func fetchInfoPlacemark()
}

class DetailTaxiViewModel: DetailTaxiViewProtocol {
    weak var delegate: DetailTaxiViewControllerProtocol?
    
    private var taxi: Taxi
    
    init(taxi: Taxi) {
        self.taxi = taxi
    }
    
    func fetchInfoPlacemark() {
        delegate?.retrieveInfoPlacemark(taxi: taxi)
    }
}
