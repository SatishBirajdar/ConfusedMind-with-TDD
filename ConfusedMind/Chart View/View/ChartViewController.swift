//
//  ViewController.swift
//  ConfusedMind
//
//  Created by Satish Birajdar on 2017-11-01.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import UIKit
import CoreData

class ChartViewController: UIViewController {

    var presenter: ChartViewPresenter = ChartViewPresenterImpl (chartService: ChartViewDataService())
    var options: [Option] = []
    
//    init(presenter: ChartViewPresenter = ChartViewPresenterImpl (chartService: ChartViewDataService())
//){
//        super.init()
//        self.presenter = presenter
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.attachView(view: self as! ChartViewPresenterView)
        presenter.getChartData()
        
//        presenter.attachView2(view: self as! ChartViewPresenterView)
    }
    
//    func asxcv(){
//    self.presenter
//    }
    

}

extension ChartViewController: ChartViewPresenterView {
    func setChartViewWithNoData() {
        
    }
    
    func setChartViewWithData() {
        
    }
    
//    func setInitialStateOfChartView() {
//        
//    }
    
    func setSpinAction() {
        
    }
    
    
}

