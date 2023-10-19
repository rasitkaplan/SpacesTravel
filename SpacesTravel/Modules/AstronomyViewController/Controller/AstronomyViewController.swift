//
//  AstronomyViewController.swift
//  SpacesTravel
//
//  Created by rasit on 13.10.2023.
//

import UIKit

class AstronomyViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables
    
    var viewModel = AstronomyModelViewModel()
    var astronomyModel: [AstronomoModel]?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        registerTableView()
        registerViewModel()
        showSpinner()
    }
    
    // MARK: - Set Navigation
    
    private func setNavigationBar() {
        title = "Astronomy Picture Of The Day"
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    // MARK: - Register
    
    func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: AstronomyTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: AstronomyTableViewCell.nameOfClass)
    }
    
    func registerViewModel() {
        viewModel.delegate = self
        viewModel.FetchAstronomoModel()
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

    // MARK: - Protocols

extension AstronomyViewController: AstronomyModelResponseProtocol {
    func astronomyModelSuccess(astronomyModel: [AstronomoModel]) {
        self.astronomyModel = astronomyModel
        tableView.reloadData()
        hideSpinner()
    }
    
    func astronomyModelFail(error: String) {
        print(error)
    }
}
