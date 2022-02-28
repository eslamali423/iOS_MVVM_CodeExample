//
//  NetworkService.swift
//  MVVM_CodeExample
//
//  Created by Eslam Ali  on 28/02/2022.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    let viewModel = UserViewModel()
    
    func fetchData()  {
        guard let url =  URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print ("cant get the url")
            return
        }
        let task  =  URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data =  data , error == nil else  {return}
            
            do {
              let response = try JSONDecoder().decode([User].self, from: data)
                
                self.viewModel.users.value = response.compactMap({
                    UserTableViewCellViewModel(name: $0.name)
                })
            }catch {
                
            }
        }
        task.resume()
    }
    
    
}
