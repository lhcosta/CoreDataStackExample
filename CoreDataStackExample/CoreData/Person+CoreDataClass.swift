//
//  Person+CoreDataClass.swift
//  CoreDataStackExample
//
//  Created by Lucas Costa  on 23/07/19.
//  Copyright © 2019 LucasCosta. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Person)
public class Person: NSManagedObject {
    
    let calendar = Calendar.current
    
    var age : Int? {
        guard let birthday = dateBirth as Date? else { return nil }
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: Date())
        
        return ageComponents.year
    }
    
}
