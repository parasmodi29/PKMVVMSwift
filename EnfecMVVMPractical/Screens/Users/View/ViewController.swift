//
//  ViewController.swift
//  EnfecMVVMPractical
//
//  Created by Paras Modi on 15/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var noDataView: UIView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    lazy var viewModel = {
        UsersViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initView()
        initViewModel()
    }


    func initView() {
        
        tblView.delegate = self
        tblView.dataSource = self
       
        tblView.register(UserCell.nib, forCellReuseIdentifier: UserCell.identifier)
    }
    
    func initViewModel() {
        // Get employees data
        viewModel.getUsers()
        
        // Reload TableView closure
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tblView.reloadData()
            }
        }
    }
}


// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userCellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier, for: indexPath) as? UserCell else { fatalError("xib does not exists") }
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellVM
        return cell
    }
}
