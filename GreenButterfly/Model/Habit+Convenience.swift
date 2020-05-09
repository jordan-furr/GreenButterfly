//
//  Habit+Convenience.swift
//  GreenButterfly
//
//  Created by Jordan Furr on 5/7/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

import Foundation
import CoreData

extension Habit {
    
    @discardableResult
    convenience init(title: String, counter: Int16, enabled: Bool, moc: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: moc)
        self.title = title
        self.counter = counter
        self.enabled = enabled
    }
}
