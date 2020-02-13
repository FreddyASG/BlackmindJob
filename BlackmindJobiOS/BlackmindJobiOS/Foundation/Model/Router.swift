//
//  Router.swift
//  BlackmindJobiOS
//
//  Created by Freddy Silva on 2/13/20.
//  Copyright © 2020 Freddy Silva. All rights reserved.
//

import UIKit

class Router: NSObject {

    private static var window: UIWindow? {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return nil }
        
        return sceneDelegate.window
    }
    
    static func setRootViewController(viewController: UIViewController) {
        window?.rootViewController = viewController
    }

    static func presentMainTaxiVC() {
        let mainTaxiViewController = MainTaxiViewController(viewModel: MainTaxiViewModel())
        setRootViewController(viewController: UINavigationController(rootViewController: mainTaxiViewController))
    }
    
    static func presentDetailTaxiVC(from viewController: UIViewController, with taxi: Taxi) {
        let detailTaxiViewController = DetailTaxiViewController(viewModel: DetailTaxiViewModel(taxi: taxi))
        viewController.navigationController?.pushViewController(detailTaxiViewController, animated: true)
    }
}
