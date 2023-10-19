//
//  LounchViewController.swift
//  SpacesTravel
//
//  Created by rasit on 28.09.2023.
//

import UIKit

class LounchViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables
    
    var launch : [Launchh]?
    var viewModel = LaunchViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSpinner()
        setNavigationBar()
        registerTableView()
        registerViewModel()
    }
    
    // MARK: - Set Navigation
    
    private func setNavigationBar() {
        self.title = "Launches"
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    // MARK: - Register
    
    func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LaunchTableViewCell", bundle: nil), forCellReuseIdentifier: "LaunchTableViewCell")
    }
    
    func registerViewModel() {
        viewModel.delegate = self
        viewModel.fetchUpcoming()
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

extension LounchViewController: LaunchProtocol {
    func launchSuccess(launch: [Launchh]) {
        self.launch = launch
        tableView.reloadData()
        hideSpinner()
    }
}
