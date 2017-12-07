//
//  ChartViewControllerTest.swift
//  ConfusedMindTests
//
//  Created by Satish Birajdar on 2017-11-28.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import XCTest
@testable import ConfusedMind

class ChartViewControllerTest: XCTestCase {
    var subject: ChartViewController?
    var presenter: ChartViewPresenterDouble?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testSpinButtonClicked(){
        subject?.spinButton.sendActions(for: .touchUpInside)
    }
    
}

class ChartViewPresenterDouble: ChartViewPresenter {
    var attachedView: ChartViewPresenterView?
    
    func attachView(view: ChartViewPresenterView) {
        attachedView = view
    }
    
    func dettachView() {
        attachedView = nil
    }
    
    func getChartData() {
    }
    
    
}
