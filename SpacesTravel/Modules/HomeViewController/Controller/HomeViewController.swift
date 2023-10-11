//
//  HomeViewController.swift
//  SpacesTravel
//
//  Created by rasit on 27.09.2023.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: - Variables
    
    var home : [Resultt]?
    var titlee : TitleModel?
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        registerTableView()
        registerCollectionView()
        viewModel.delegate = self
        viewModel.fetchNewsHome()
    }
    
    // MARK: - Set Navigation
    
    private func setNavigationBar() {
        self.title = "News"
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    // MARK: - Register
    
    private func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    private func registerCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
}
// MARK: - Protocols

extension HomeViewController: HomeListProtocol {
    func newsSuccess(news: [Resultt]) {
        self.home = news
        tableView.reloadData()
    }
}
    
