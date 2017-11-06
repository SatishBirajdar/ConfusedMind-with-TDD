//
//  ManagedContext.swift
//  ConfusedMind
//
//  Created by Satish Birajdar on 2017-11-01.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ManagedContext {

    var options : [Option] = []
    var managedContext: NSManagedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    func setManagedContext() {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
         self.managedContext = appDelegate.persistentContainer.viewContext
    }
    
    func fetchOptions() -> [Option] {
        
        setManagedContext()
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Option")
        
        do {
            self.options = try self.managedContext.fetch(fetchRequest) as! [Option]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return self.options
    }
    
//    func save(name: String) {
//        guard let appDelegate =
//            UIApplication.shared.delegate as? AppDelegate else {
//                return
//        }
//        
//        let managedContext =
//            appDelegate.persistentContainer.viewContext
//        
//        let entity =
//            NSEntityDescription.entity(forEntityName: "Item",
//                                       in: managedContext)!
//        
//        let item = NSManagedObject(entity: entity,
//                                   insertInto: managedContext)
//        
//        item.setValue(name, forKeyPath: "name")
//        
//        do {
//            try managedContext.save()
//            items.append(item)
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
//    }
    

    func deleteOptionFromManagedContext(index: Int)
    {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let optionToDelete = options[index]
        
        managedContext.delete(optionToDelete)
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
//    func entityForOptionName(optionName: String) -> NSManagedObject {
//        guard let appDelegate =
//            UIApplication.shared.delegate as? AppDelegate else {
//                return
//        }
//        
//        let managedContext =
//            appDelegate.persistentContainer.viewContext
//        
//        let entity =
//            NSEntityDescription.entity(forEntityName: "Item",
//                                       in: managedContext)!
//        
//        let item = NSManagedObject(entity: entity,
//                                   insertInto: managedContext)
//        
//        
//        
//        item.setValue(optionName, forKeyPath: "name")
//        
//        return item
//    }
//    
//    func saveEntityToManagedObject(){
//        
//    }
    
    func editOptionFromManagedContext(optionName: String ,index: Int){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Option")
        
        do {
            let options = try managedContext.fetch(fetchRequest)
            let option = options[index]
            option.setValue(optionName, forKey: "name")

            do {
                try managedContext.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }
        } catch {
            print("Error with request: \(error)")
        }
    }
}
