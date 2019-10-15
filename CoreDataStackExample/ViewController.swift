//
//  ViewController.swift
//  CoreDataStackExample
//
//  Created by Lucas Costa  on 23/07/19.
//  Copyright © 2019 LucasCosta. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var managedContext : NSManagedObjectContext!
    var person : Person?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //createPerson()
        //fetchForBirthday()
        fetchPerson()
    }
    
    //Create a person for example
    func createPerson() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let person = Person(context: self.managedContext)
        person.name = "Flavio"
        
        if let date = dateFormatter.date(from: "26/10/1998") {
            person.dateBirth = date as NSDate
        }
            
        do {
            try self.managedContext.save()
            print("Create Succesfully")
        } catch let error as NSError {
            print(error.userInfo)
        }
    }
    
    //Realizando busca com base na que foi settada no Data Model Editor
    func fetchForBirthday() {
        
        guard let model = self.managedContext.persistentStoreCoordinator?.managedObjectModel else {return}
        
        guard let fetchRequest = model.fetchRequestTemplate(forName: "FetchRequest") as? NSFetchRequest<Person> else {return}
        
        do {
            let allPerson = try self.managedContext.fetch(fetchRequest)
            
            allPerson.forEach { (person) in
                print("Name -> \(person.name)")
            }
            
        } catch let error as NSError {
            print(error.userInfo)
        }
    }
    
    //Fetch the first person
    func fetchPerson() {
                
        let fetch : NSFetchRequest<Person> = Person.fetchRequest()
        let predicate = NSPredicate(format: "%K CONTAINS[cd] %@", #keyPath(Person.name), "a")
        let sort = NSSortDescriptor(key: #keyPath(Person.name), ascending: false)
        
        fetch.sortDescriptors = [sort]
        fetch.predicate = predicate
        
        do {
            let allPerson = try self.managedContext.fetch(fetch)
            
            allPerson.forEach { (person) in
                print("Name -> \(person.name) -> \(person.age!) anos")
            }
        
        } catch let error as NSError {
            print(error.userInfo)
        }
    }

    
    //Create animals
    func createAnimal() {
        
        let animal = Animal(context: self.managedContext)
        animal.name = "Boi"
        
        if let animals = person?.animals?.mutableCopy() as? NSMutableOrderedSet {
            animals.add(animal)
            person?.animals = animals
        }
            
        do {
            try managedContext.save()
            print("Create animal succesfully")
        } catch let error as NSError {
            print(error.userInfo)
        }
    }
    
    //Fetch user's animals
    func fetchAnimal() {
        
        let fetchAnimals : NSFetchRequest<Animal> = Animal.fetchRequest() 
        //let predicate = NSPredicate(format: "%K == %@", #keyPath(Animal.owner), self.person!)
        
        //fetchAnimals.predicate = predicate
        
        do {
            let animals = try self.managedContext.fetch(fetchAnimals)
            
            animals.forEach { (animal) in
                print("Animal - \(animal.name!)")
            }
            
        } catch let error as NSError {
            print(error.userInfo)
        }
        
    }
    
    //Delete an animal
    func deleteAnimal() {
        
        guard let animal = self.person?.animals?.firstObject as? Animal else {return}
        
        do {
            self.managedContext.delete(animal)
            try self.managedContext.save()            
        } catch let error as NSError {
            print(error.userInfo)
        }
        
    }
    
    //Delete a person
    func deletePerson() {
        
        do {
            self.managedContext.delete(person!)
            try self.managedContext.save()
        } catch let error as NSError {
            print(error.userInfo)
        }
        
        
    }

}

