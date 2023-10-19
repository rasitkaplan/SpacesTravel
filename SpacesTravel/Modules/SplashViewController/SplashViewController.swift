//
//  SplashViewController.swift
//  SpacesTravel
//
//  Created by rasit on 27.09.2023.
//

import UIKit

class SplashViewController: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            let vc = HomeViewController()
            self.navigationController?.setViewControllers([vc], animated: true)
        }
    }
}
