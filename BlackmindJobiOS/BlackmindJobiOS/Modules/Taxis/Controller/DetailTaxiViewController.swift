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
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var vinLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var coordinatesLabel: UILabel!
    @IBOutlet weak var interiorLabel: UILabel!
    @IBOutlet weak var exteriorLabel: UILabel!
    @IBOutlet weak var fuelLabel: UILabel!
    @IBOutlet weak var engineTypeLabel: UILabel!
    
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
        settingContainerView()
        
        viewModel?.delegate = self
        viewModel?.fetchInfoPlacemark()
    }

    // MARK: - Settings
    private func settingGoogleMap() {
        mapView.delegate = self
        marker.map = mapView
    }
    
    private func settingContainerView() {
        containerView.layer.cornerRadius = 10
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
        
        nameLabel.text = taxi.name
        vinLabel.text = taxi.vin
        addressLabel.text = taxi.address
        coordinatesLabel.text = "\(taxi.latitude), \(taxi.longitude)"
        interiorLabel.text = taxi.interior
        exteriorLabel.text = taxi.exterior
        fuelLabel.text = "\(String(describing: taxi.fuel ?? 0))"
        engineTypeLabel.text = taxi.engineType
        
        marker.title = taxi.name
    }
}

// MARK: - GMSMapViewDelegate
extension DetailTaxiViewController: GMSMapViewDelegate {
}
