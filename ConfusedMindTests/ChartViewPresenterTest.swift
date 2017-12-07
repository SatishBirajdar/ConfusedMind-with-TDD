//
//  ConfusedMindTests.swift
//  ConfusedMindTests
//
//  Created by Satish Birajdar on 2017-11-01.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import XCTest
import Hamcrest
import CoreData

@testable import ConfusedMind

class ChartViewPresenterTest: XCTestCase {
    
    fileprivate var subject: ChartViewPresenter?
    var service: ChartViewDataServiceMock?
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
    }
    
    func testChartDataWithZeroItems(){
        let options: [Option] = []
        let view = ViewSpy()
        subject = ChartViewPresenterImpl(chartService: ChartViewDataServiceMock(options: options))
        subject?.attachView(view: view)
        subject?.getChartData()
        assertThat(view.emptyChartViewCalledCount, equalTo(1))
    }
    
    func testChartDataWithOneItems(){
        let options = addOptionWithNameToManagedContext("Satish")
        let view = ViewSpy()
        subject = ChartViewPresenterImpl(chartService: ChartViewDataServiceMock(options: options as! [Option]))
        subject?.attachView(view: view)
        subject?.getChartData()
        assertThat(view.chartViewWithDataCalledCount, equalTo(1))
    }
    
    func addOptionWithNameToManagedContext(_ optionName: String) -> [NSManagedObject] {
        var options : [NSManagedObject] = []
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext =
            appDelegate?.persistentContainer.viewContext
        
        let entity =
            NSEntityDescription.entity(forEntityName: "Option",
                                       in: managedContext!)!
        
        let option = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        option.setValue(optionName, forKeyPath: "name")
        
        do {
            try managedContext?.save()
            options.append(option)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        print("My managed object: ", managedContext)
        return options
    }
}

class ChartViewDataServiceMock : ChartViewDataService {
    var options: [Option]
    init(options: [Option]){
        self.options = options
    }
    
    override func getChartData(_ callBack: @escaping ([Option]) -> Void) {
        callBack (self.options)
    }
}

class ViewSpy: ChartViewPresenterView {

    var emptyChartViewCalledCount: Int = 0
    var chartViewWithDataCalledCount: Int = 0
    
    func setChartViewWithData() {
        chartViewWithDataCalledCount += 1
    }
    func setChartViewWithNoData() {
        emptyChartViewCalledCount += 1
    }
    
    func setEmptyChartView() {
    }
    
    func setSpinAction() {
    }
    
    func setInitialStateOfChartView() {
    }
}
