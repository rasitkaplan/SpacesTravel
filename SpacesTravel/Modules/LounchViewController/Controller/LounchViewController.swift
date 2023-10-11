//
//  LounchViewController.swift
//  SpacesTravel
//
//  Created by rasit on 28.09.2023.
//

import UIKit

class LounchViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    var launch : [Launchh]?
    var viewModel = LaunchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RegisterTableView()
        RegisterViewModel()
        // Do any additional setup after loading the view.
    }
    
    func RegisterTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LaunchTableViewCell", bundle: nil), forCellReuseIdentifier: "LaunchTableViewCell")
    }
    
    func RegisterViewModel() {
        viewModel.delegate = self
        viewModel.fetchUpcoming()
    }
}

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

extension LounchViewController: LaunchProtocol {
    func launchSuccess(launch: [Launchh]) {
        self.launch = launch
        tableView.reloadData()
    }
}
