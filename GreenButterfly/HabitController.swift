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
    
    var habits: [Habit] {
        get {let fetchRequest: NSFetchRequest<Habit> = Habit.fetchRequest()
            return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []}
    }
    
    //MARK: CRUD Update Funcs
    func add(title: String, enabled: Bool){
        Habit(title: title, counter: 0, enabled: enabled)
    }
    
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
