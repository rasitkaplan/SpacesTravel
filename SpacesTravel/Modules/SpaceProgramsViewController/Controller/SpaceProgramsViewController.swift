//
//  SpaceProgramsViewController.swift
//  SpacesTravel
//
//  Created by rasit on 16.10.2023.
//

import UIKit

class SpaceProgramsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var spaceProgramsTableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // MARK: - Variables
    
    var viewModel = SpaceProgramsViewModel()
    var spacePrograms: [SpacePrograms]?
    
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
        title = "Space Programs"
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    // MARK: - Register
    
    func registerTableView() {
        spaceProgramsTableView.delegate = self
        spaceProgramsTableView.dataSource = self
        spaceProgramsTableView.register(UINib(nibName: SpaceProgramsTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: SpaceProgramsTableViewCell.nameOfClass)
    }
    
    func registerViewModel() {
        viewModel.delegate = self
        viewModel.fetchSpacePrograms()
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

extension SpaceProgramsViewController: SpaceProgramsResponseProtocol {
    func programSuccess(programm program: [SpacePrograms]) {
        self.spacePrograms = program
        spaceProgramsTableView.reloadData()
        hideSpinner()
    }
    
    func programFail(error: String) {
        print(error)
    }
}
