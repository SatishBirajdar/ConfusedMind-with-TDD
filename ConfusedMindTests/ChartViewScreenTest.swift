//
//  ChartViewScreenTest.swift
//  ConfusedMindTests
//
//  Created by Satish Birajdar on 2017-12-04.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import XCTest
import FBSnapshotTestCase

@testable import ConfusedMind

class ChartViewScreenTest: FBSnapshotTestCase {
//    var chartView: UIViewController?
    var nav: UINavigationController?
    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    func testChartView(){
        let window: UIWindow
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "ChartViewController")
        window.rootViewController = initialViewController
        window.makeKeyAndVisible()
        
        FBSnapshotVerifyView(initialViewController.view)
    }
    

    
}
