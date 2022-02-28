//
//  ViewController.swift
//  MVVM_CodeExample
//
//  Created by Eslam Ali  on 25/02/2022.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    //private var viewModel =  UserViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        NetworkService.shared.viewModel.users.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        NetworkService.shared.fetchData()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return   NetworkService.shared.viewModel.users.value?.count ?? 0
   //     return viewModel.users.value?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = NetworkService.shared.viewModel.users.value?[indexPath.row].name
        return cell
    }


    
}


