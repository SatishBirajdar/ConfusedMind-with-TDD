//
//  ChartViewPresenterImpl.swift
//  ConfusedMind
//
//  Created by Satish Birajdar on 2017-11-01.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import Foundation
import CoreData

class ChartViewPresenterImpl: ChartViewPresenter {
  
    
    var view: ChartViewPresenterView?
    var chartService: ChartViewDataService
    
    init(chartService: ChartViewDataService) {
        self.chartService = chartService
    }
    
    func attachView(view: ChartViewPresenterView) {
        self.view = view
    }
    func  dettachView() {
        self.view = nil
    }

    
    func getChartData() {
        self.chartService.getChartData{ [weak self] options in
//            self?.userView?.finishLoading()
            if(options.count == 0){
                self?.view?.setChartViewWithNoData()
                
//                self?.userView?.setEmptyUsers()
            }else{
                self?.view?.setChartViewWithData()
//                let mappedUsers = users.map{
//                    return UserViewData(name: "\($0.firstName) \($0.lastName)", age: "\($0.age) years")
//                }
//                self?.userView?.setUsers(mappedUsers)
            }
//        callBack (options)
    }
    }
    
//    func getUsers(){
//        self.userView?.startLoading()
//        userService.getUsers{ [weak self] users in
//            self?.userView?.finishLoading()
//            if(users.count == 0){
//                self?.userView?.setEmptyUsers()
//            }else{
//                let mappedUsers = users.map{
//                    return UserViewData(name: "\($0.firstName) \($0.lastName)", age: "\($0.age) years")
//                }
//                self?.userView?.setUsers(mappedUsers)
//            }
//
//        }
//    }

}
