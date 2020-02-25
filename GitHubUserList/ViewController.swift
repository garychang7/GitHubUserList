//
//  ViewController.swift
//  GitHubUserList
//
//  Created by gary on 2020/2/25.
//  Copyright © 2020 gary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let viewModel = ViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.delegate = self
        viewModel.fetchData()
        
    }
    
    func setupTableView() {
        let name = String(describing: USERTABLEVIEWCELL)
        let nib = UINib(nibName: name, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: USERTABLEVIEWCELL)
    }
}
extension ViewController:ViewModelDelegate {
    
    func updateView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showAlert(msg: String) {
        
    }
}

// MARK: - @protocol UITableViewDelegate
extension ViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
    }
    
}
// MARK: - @protocol UITableViewDataSource
extension ViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: USERTABLEVIEWCELL, for: indexPath) as! UserTableViewCell
        
        cell.setupUser(user: viewModel.dataSource[indexPath.row])
        
        return cell
    }
}
