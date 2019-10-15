//
//  Person+CoreDataProperties.swift
//  CoreDataStackExample
//
//  Created by Lucas Costa  on 23/07/19.
//  Copyright © 2019 LucasCosta. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String
    @NSManaged public var dateBirth: NSDate?
    @NSManaged public var animals: NSOrderedSet?

}

// MARK: Generated accessors for animals
extension Person {

    @objc(insertObject:inAnimalsAtIndex:)
    @NSManaged public func insertIntoAnimals(_ value: Animal, at idx: Int)

    @objc(removeObjectFromAnimalsAtIndex:)
    @NSManaged public func removeFromAnimals(at idx: Int)

    @objc(insertAnimals:atIndexes:)
    @NSManaged public func insertIntoAnimals(_ values: [Animal], at indexes: NSIndexSet)

    @objc(removeAnimalsAtIndexes:)
    @NSManaged public func removeFromAnimals(at indexes: NSIndexSet)

    @objc(replaceObjectInAnimalsAtIndex:withObject:)
    @NSManaged public func replaceAnimals(at idx: Int, with value: Animal)

    @objc(replaceAnimalsAtIndexes:withAnimals:)
    @NSManaged public func replaceAnimals(at indexes: NSIndexSet, with values: [Animal])

    @objc(addAnimalsObject:)
    @NSManaged public func addToAnimals(_ value: Animal)

    @objc(removeAnimalsObject:)
    @NSManaged public func removeFromAnimals(_ value: Animal)

    @objc(addAnimals:)
    @NSManaged public func addToAnimals(_ values: NSOrderedSet)

    @objc(removeAnimals:)
    @NSManaged public func removeFromAnimals(_ values: NSOrderedSet)

}
