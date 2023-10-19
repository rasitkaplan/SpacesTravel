//
//  MarsPhotosViewController.swift
//  SpacesTravel
//
//  Created by rasit on 2.10.2023.
//

import UIKit

class MarsPhotosViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak private var marsTableView: UITableView!
    
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    // MARK: - Variables
    
    var marsPhotoModel: [LatestPhoto]?
    var viewModel = MarsPhotosViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        registerTableView()
        registerViewModel()
    }
    
    // MARK: - Set Navigation
    
    private func setNavigationBar() {
        title = "Mars Photos"
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    // MARK: - Register
    
    private func registerTableView() {
        marsTableView.delegate = self
        marsTableView.dataSource = self
        marsTableView.register(UINib(nibName: MarsPhotosTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: MarsPhotosTableViewCell.nameOfClass)
    }
    
    private func registerViewModel() {
        viewModel.delegate = self
        viewModel.FetchMarsPhoto()
    }
    
    // MARK: - ActivityIndicator
    
    private func showSpinner() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }

    private func hideSpinner() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}

// MARK: -  Protocols

extension MarsPhotosViewController: MarsPhotosProtocol {
    
    func marsphotosSuccess(latestPhoto: [LatestPhoto]) {
        self.marsPhotoModel = latestPhoto
        marsTableView.reloadData()
        hideSpinner()
    }
    
    func marsphotosFail(error: String) {
        print(error)
    }
}
