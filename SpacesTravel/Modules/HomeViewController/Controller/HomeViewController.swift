//
//  HomeViewController.swift
//  SpacesTravel
//
//  Created by rasit on 27.09.2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var home : [Resultt]?
    var titlee : TitleModel?
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News"
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.tintColor = .white
        RegisterTableView()
        RegisterCollectionView()
        viewModel.delegate = self
        viewModel.fetchNewsHome()
    }
    
    private func RegisterTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    private func RegisterCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
}

extension HomeViewController: HomeListProtocol {
    func newsSuccess(news: [Resultt]) {
        self.home = news
        tableView.reloadData()
    }
}
    
