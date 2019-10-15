//
//  CoreDataStack.swift
//  CoreDataStackExample
//
//  Created by Lucas Costa  on 23/07/19.
//  Copyright © 2019 LucasCosta. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    private let modelName : String
    
    init(modelName : String) {
        self.modelName = modelName
    }
    
    //Managed Context
    lazy var managedContext : NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()
    
    //Persistent Container
    private lazy var storeContainer : NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: self.modelName)
        
        container.loadPersistentStores(completionHandler: { (_,error) in
            if let containerError = error as NSError? {
                print("Error -> \(containerError.userInfo)")
            }
        })
        
        return container
    }()
    
    //Save Context
    func saveContext() {
        guard self.managedContext.hasChanges else { return }
        
        do {
            try self.managedContext.save()
        } catch let error as NSError {
            print("Error -> \(error.userInfo)")
        }
    }
  
}
