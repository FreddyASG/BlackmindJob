//
//  DetailTaxiViewController.swift
//  BlackmindJobiOS
//
//  Created by Freddy Silva on 2/13/20.
//  Copyright © 2020 Freddy Silva. All rights reserved.
//

import UIKit
import GoogleMaps

protocol DetailTaxiViewControllerProtocol: class {
    func retrieveInfoPlacemark(taxi: Taxi)
}

class DetailTaxiViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var mapView: GMSMapView!
    
    private var viewModel: DetailTaxiViewProtocol?
    
    let marker: GMSMarker = {
        var mark = GMSMarker()
        mark.icon = UIImage(named: "pin_marker_ico")
        return mark
    }()
    
    convenience init(viewModel: DetailTaxiViewProtocol) {
        self.init()
        self.viewModel = viewModel
    }

    // MARK: - ViewController Life's Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        settingGoogleMap()
        
        viewModel?.delegate = self
        viewModel?.fetchInfoPlacemark()
    }

    // MARK: - Settings
    private func settingGoogleMap() {
        mapView.delegate = self
        marker.map = mapView
    }
    
    private func setCameraMapView(with coordinate: CLLocationCoordinate2D) {
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude,
                                              longitude: coordinate.longitude,
                                              zoom: 16.0)
        mapView.camera = camera
        marker.position = coordinate
    }
}

// MARK: - DetailTaxiViewControllerProtocol
extension DetailTaxiViewController: DetailTaxiViewControllerProtocol {
    func retrieveInfoPlacemark(taxi: Taxi) {
        
        let coordinate = CLLocationCoordinate2D(latitude: taxi.latitude, longitude: taxi.longitude)
        setCameraMapView(with: coordinate)
        
        
    }
}

// MARK: - GMSMapViewDelegate
extension DetailTaxiViewController: GMSMapViewDelegate {
}
