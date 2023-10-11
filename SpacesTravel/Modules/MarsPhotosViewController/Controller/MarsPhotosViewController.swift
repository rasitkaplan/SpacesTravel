//
//  MarsPhotosViewController.swift
//  SpacesTravel
//
//  Created by rasit on 2.10.2023.
//

import UIKit

class MarsPhotosViewController: UIViewController {

    @IBOutlet weak var marsTableView: UITableView!
    
    var marsPhotoModel: [LatestPhoto]?
    var viewModel = MarsPhotosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mars Photos"
        RegisterTableView()
        RegisterViewModel()
    }
    
    func RegisterTableView() {
        marsTableView.delegate = self
        marsTableView.dataSource = self
        marsTableView.register(UINib(nibName: MarsPhotosTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: MarsPhotosTableViewCell.nameOfClass)
    }
    
    func RegisterViewModel() {
        viewModel.delegate = self
        viewModel.FetchMarsPhoto()
    }
}

extension MarsPhotosViewController: MarsPhotosProtocol {
    
    func marsphotosSuccess(latestPhoto: [LatestPhoto]) {
        self.marsPhotoModel = latestPhoto
        marsTableView.reloadData()
    }
    
    func marsphotosFail(error: String) {
        print(error)
    }
}
