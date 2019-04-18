//
//  ApiService.swift
//  ViperDemo
//
//  Created by RD-WilleyLo on 2019/4/18.
//  Copyright © 2019 Abhisek. All rights reserved.
//

import Foundation

private let apiService_sharedInstance = ApiService()

class ApiService {
    
    let serviceQ = DispatchQueue(label: "ApiServiceQueue", qos: .background, attributes: [.concurrent])
    
    class func shared() -> ApiService {
        return apiService_sharedInstance
    }
    
    func fetchForTwoSec(nextTask: @escaping (_ result: [Fruit]) -> Void) {
        serviceQ.asyncAfter(deadline: .now() + 2, execute: {
            DispatchQueue.main.async {
                var fruitList = [Fruit]()
                let allFruitDetail = Common.generateDataList()
                for item in allFruitDetail {
                    fruitList.append(Fruit(attributes: item))
                }
                nextTask(fruitList)
            }
        })
    }
}
