//
//  DetailTaxiViewController.swift
//  BlackmindJobiOS
//
//  Created by Freddy Silva on 2/13/20.
//  Copyright © 2020 Freddy Silva. All rights reserved.
//

import UIKit

protocol DetailTaxiViewControllerProtocol: class {
}

class DetailTaxiViewController: UIViewController {
    
    private var viewModel: DetailTaxiViewProtocol?
    
    convenience init(viewModel: DetailTaxiViewProtocol) {
        self.init()
        self.viewModel = viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}
