//
//  Observable.swift
//  MVVM_CodeExample
//
//  Created by Eslam Ali  on 28/02/2022.
//

import Foundation
 
class Observable<T> {

    var value  : T? {
        didSet {
            listner?(value)
        }
    }
     
    var listner : ((T?) -> Void)?
    
    init(value : T?) {
        self.value =  value
    }
    
    func bind(listner: @escaping ((T?)->Void) )   {
        listner(value)
        self.listner = listner
    }
    
    
}
