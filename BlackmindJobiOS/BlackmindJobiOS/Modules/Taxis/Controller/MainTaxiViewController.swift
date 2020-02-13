//
//  MainTaxiViewController.swift
//  BlackmindJobiOS
//
//  Created by Freddy Silva on 2/12/20.
//  Copyright © 2020 Freddy Silva. All rights reserved.
//

import UIKit

protocol MainTaxiViewControllerProtocol: class {
    func retrieveTaxi(info: TaxiResponse)
    func fetchTaxiFail()
}

class MainTaxiViewController: UIViewController {
    
    // MARK: - Outlets
    
    private var viewModel: MainTaxiViewProtocol?
    
    convenience init(viewModel: MainTaxiViewProtocol) {
        self.init()
        self.viewModel = viewModel
    }

    // MARK: - ViewController Life's Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.delegate = self
        viewModel?.fetchTaxiInfo()
    }

}

// MARK: - MainTaxiViewControllerProtocol
extension MainTaxiViewController: MainTaxiViewControllerProtocol {
    func retrieveTaxi(info: TaxiResponse) {
    }
    
    func fetchTaxiFail() {
    }
}
