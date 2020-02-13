//
//  MainTaxiViewController.swift
//  BlackmindJobiOS
//
//  Created by Freddy Silva on 2/12/20.
//  Copyright © 2020 Freddy Silva. All rights reserved.
//

import UIKit

protocol MainTaxiViewControllerProtocol: class {
    func retrieveInfo(placemarks: [Taxi]?)
    func fetchTaxiFail()
}

class MainTaxiViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: MainTaxiViewProtocol?
    private var placemarks = [Taxi]()
    
    struct Constants {
        static let cellNibName = "TaxiCollectionViewCell"
    }
    
    convenience init(viewModel: MainTaxiViewProtocol) {
        self.init()
        self.viewModel = viewModel
    }

    // MARK: - ViewController Life's Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingCollectionView()

        viewModel?.delegate = self
        viewModel?.fetchTaxiInfo()
    }

    // MARK: - Settings
    private func settingCollectionView() {
        collectionView.register(UINib(nibName: Constants.cellNibName, bundle: nil),
                                forCellWithReuseIdentifier: TaxiCollectionViewCell.reuseIdentifier)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension MainTaxiViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placemarks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaxiCollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? TaxiCollectionViewCell else {
            fatalError()
        }
        
        cell.taxi = placemarks[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.size.width, height: TaxiCollectionViewCell.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Router.presentDetailTaxiVC(from: self, with: placemarks[indexPath.row])
    }
}

// MARK: - MainTaxiViewControllerProtocol
extension MainTaxiViewController: MainTaxiViewControllerProtocol {
    func retrieveInfo(placemarks: [Taxi]?) {
        guard let placemarks = placemarks else {
            self.placemarks = []
            return
        }
        
        self.placemarks = placemarks
        
        DispatchQueue.main.async(execute: {
            self.collectionView.reloadData()
        })

    }
    
    func fetchTaxiFail() {
    }
}
