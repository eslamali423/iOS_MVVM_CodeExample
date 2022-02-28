//
//  UserViewModel.swift
//  MVVM_CodeExample
//
//  Created by Eslam Ali  on 28/02/2022.
//

import Foundation

struct UserViewModel {
    var users : Observable<[UserTableViewCellViewModel]> = Observable(value: [])
    
}


struct UserTableViewCellViewModel {
    var name : String
}
