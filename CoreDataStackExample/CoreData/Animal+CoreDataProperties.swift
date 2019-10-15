//
//  Animal+CoreDataProperties.swift
//  CoreDataStackExample
//
//  Created by Lucas Costa  on 23/07/19.
//  Copyright © 2019 LucasCosta. All rights reserved.
//
//

import Foundation
import CoreData


extension Animal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Animal> {
        return NSFetchRequest<Animal>(entityName: "Animal")
    }

    @NSManaged public var name: String?
    @NSManaged public var owner: Person?

}
