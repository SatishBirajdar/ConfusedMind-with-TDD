//
//  ViewController.swift
//  ConfusedMind
//
//  Created by Satish Birajdar on 2017-11-01.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import UIKit
import CoreData
import Charts

class ChartViewController: UIViewController {

    @IBOutlet weak var speakerButton: UIButton!
    
    @IBOutlet weak var emptyChartView: UIView!
    @IBOutlet weak var emptyChartViewLabel: UILabel!
    
    @IBOutlet weak var nonEmptyChartView: PieChartView!
    @IBOutlet weak var spinButton: UIButton!
    
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
        
    }
    
    
    @IBAction func spinButtonClicked(_ sender: UIButton) {
    }
    
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

