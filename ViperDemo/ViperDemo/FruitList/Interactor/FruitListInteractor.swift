//
//  FruitListInteractor.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

class FruitListInteractor: FruitListInputInteractorProtocol {
    
    weak var presenter: FruitListOutputInteractorProtocol?
    
    func getFruitList() {
        // Api Service
        ApiService.shared().fetchForTwoSec(nextTask: {[weak self] (fruits: [Fruit]) in
            self?.presenter?.fruitListDidFetch(fruitList: fruits)
        })
    }
}
