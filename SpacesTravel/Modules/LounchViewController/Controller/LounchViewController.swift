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
    
    // MARK: - Variables
    
    var launch : [Launchh]?
    var viewModel = LaunchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

// MARK: - TableView Functions

extension LounchViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launch?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: LaunchTableViewCell.nameOfClass, for: indexPath) as? LaunchTableViewCell {
            cell.setCell(launch: (launch?[indexPath.row])!)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = LounchViewController()
        vc.launch = launch
    }
}
// MARK: - Protocols

extension LounchViewController: LaunchProtocol {
    func launchSuccess(launch: [Launchh]) {
        self.launch = launch
        tableView.reloadData()
    }
}
