//
//  CoreDataStack.swift
//  GreenButterfly
//
//  Created by Jordan Furr on 5/7/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    static let container: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "GreenButterfly")
        container.loadPersistentStores { (_, error) in
            if let error = error {
            fatalError("Failed to load persistent stores \(error)")
            }
        }
        return container
    }()
    //saves hassle of writing container.viewContext
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}
