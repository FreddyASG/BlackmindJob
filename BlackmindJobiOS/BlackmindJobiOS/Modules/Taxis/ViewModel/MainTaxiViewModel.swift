//
//  MainTaxiViewModel.swift
//  BlackmindJobiOS
//
//  Created by Freddy Silva on 2/12/20.
//  Copyright © 2020 Freddy Silva. All rights reserved.
//

import Foundation

protocol MainTaxiViewProtocol: class {
    var delegate: MainTaxiViewControllerProtocol? { get set }
    func fetchTaxiInfo()
}

class MainTaxiViewModel: MainTaxiViewProtocol {
    weak var delegate: MainTaxiViewControllerProtocol?
    
    private var taxiService: TaxiService

    init() {
        taxiService = .init()
    }
    
    func fetchTaxiInfo() {
        taxiService.fetchTaxiInfo { [weak self] (result) in
            do {
                let taxiInfo = try result.get()
                self?.delegate?.retrieveInfo(placemarks: taxiInfo.placemarks)
            } catch {
                self?.delegate?.fetchTaxiFail()
            }
        }
    }
}
