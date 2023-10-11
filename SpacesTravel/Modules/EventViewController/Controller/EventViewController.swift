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
    
    // MARK: - Variables
    
    var viewModel = PastEventsViewModel()
    var event : [Past]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

// MARK: - Protocol

extension EventViewController : PastEventsResponseProtocol {
    func pastEventsSuccess(pastEvents: [Past]) {
        self.event = pastEvents
        eventTableView.reloadData()
    }
    
    func pastEventsFail(error: String) {
        print(error)
    }
}
