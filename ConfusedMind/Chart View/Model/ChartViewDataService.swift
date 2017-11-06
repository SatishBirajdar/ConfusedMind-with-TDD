//
//  ChartViewDataService.swift
//  ConfusedMind
//
//  Created by Satish Birajdar on 2017-11-01.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import Foundation
import CoreData

class ChartViewDataService {
    var managedContext : ManagedContext = ManagedContext ()

    
//    func getChartData() -> [Option] {
//        return managedContext.fetchOptions()
//    }
//    
    func getChartData(_ callBack:@escaping ([Option]) -> Void) {
        let options: [Option] = managedContext.fetchOptions()
        callBack (options)
    }
}
