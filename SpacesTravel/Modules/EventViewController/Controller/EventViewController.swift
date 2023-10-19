//
//  EventViewController.swift
//  SpacesTravel
//
//  Created by rasit on 2.10.2023.
//

import UIKit

class EventViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var eventTableView: UITableView!
    
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    // MARK: - Variables
    
    var viewModel = PastEventsViewModel()
    var event : [Past]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSpinner()
        setNavigationBar()
        registerTableView()
        registerViewModel()
    }
    // MARK: - Set Navigation
    
    private func setNavigationBar() {
        self.title = "Events"
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    // MARK: - Register
    
    private func registerTableView() {
        eventTableView.delegate = self
        eventTableView.dataSource = self
        eventTableView.register(UINib(nibName: EventTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: EventTableViewCell.nameOfClass)
    }
    
    private func registerViewModel() {
        viewModel.delegate = self
        viewModel.fetchPastEvents()
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

// MARK: - Protocol

extension EventViewController : PastEventsResponseProtocol {
    func pastEventsSuccess(pastEvents: [Past]) {
        self.event = pastEvents
        eventTableView.reloadData()
        hideSpinner()
    }
    
    func pastEventsFail(error: String) {
        print(error)
    }
}
