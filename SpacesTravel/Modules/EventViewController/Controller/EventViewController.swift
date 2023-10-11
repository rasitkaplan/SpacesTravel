//
//  EventViewController.swift
//  SpacesTravel
//
//  Created by rasit on 2.10.2023.
//

import UIKit

class EventViewController: UIViewController {

    @IBOutlet weak var eventTableView: UITableView!
    
    var viewModel = PastEventsViewModel()
    var event : [Past]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RegisterTableView()
        RegisterViewModel()
        // Do any additional setup after loading the view.
    }
    
    func RegisterTableView() {
        eventTableView.delegate = self
        eventTableView.dataSource = self
        eventTableView.register(UINib(nibName: EventTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: EventTableViewCell.nameOfClass)
    }
    
    func RegisterViewModel() {
        viewModel.delegate = self
        viewModel.fetchPastEvents()
    }
}

extension EventViewController : PastEventsResponseProtocol {
    func pastEventsSuccess(pastEvents: [Past]) {
        self.event = pastEvents
        eventTableView.reloadData()
    }
    
    func pastEventsFail(error: String) {
        print(error)
    }
}
