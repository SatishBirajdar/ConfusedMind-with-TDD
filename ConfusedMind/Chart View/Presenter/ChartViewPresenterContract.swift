//
//  ChartViewPresenterContract.swift
//  ConfusedMind
//
//  Created by Satish Birajdar on 2017-11-01.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import Foundation

protocol ChartViewPresenterView {
//    func setInitialStateOfChartView()
    func setChartViewWithNoData()
    func setChartViewWithData()
    func setSpinAction()
}

protocol ChartViewPresenter {
    func attachView(view: ChartViewPresenterView)
    func dettachView()
    func getChartData()
}
