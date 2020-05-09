//
//  HabitController.swift
//  GreenButterfly
//
//  Created by Jordan Furr on 5/7/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

import Foundation
import CoreData

class HabitController {
    static let shared = HabitController()
    
    let fetchedResultsController: NSFetchedResultsController<Habit> = {
        let request: NSFetchRequest<Habit> = Habit.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        let resultsController: NSFetchedResultsController<Habit> = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "enabled", cacheName: nil)
        return resultsController
    }()
    
    //MARK: Initializer
    init() {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("Error fetching data \(error)")
        }
    }
    
    var habits: [Habit] = [
        Habit(title: "eat", counter: 0, enabled: true),
        Habit(title: "drink", counter: 3, enabled: true),
        Habit(title: "poop", counter: 0, enabled: false),
        Habit(title: "watch tv", counter: 0, enabled: false),
        Habit(title: "smoke weed", counter: 0, enabled: false)
    ]
    
    //MARK: CRUD Update Funcs
    func updateCounter(habit: Habit) {
        habit.counter = habit.counter + 1
        saveToPersistenceStore()
    }
    
    func enableToggle(habit: Habit) {
        habit.enabled = !habit.enabled
        saveToPersistenceStore()
    }
    
    func remove(habit: Habit){
        CoreDataStack.context.delete(habit)
        saveToPersistenceStore()
    }
    
    func saveToPersistenceStore(){
        do { try CoreDataStack.context.save()
        } catch {
            print("There was an error saving the data!!!!! \(#function) \(error.localizedDescription)")
        }
    }
}
