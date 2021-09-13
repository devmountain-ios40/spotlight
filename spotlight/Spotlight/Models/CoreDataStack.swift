//
//  CoreDataStack.swift
//  Spotlight
//
//  Created by Stephen Davis on 9/13/21.
//

import CoreData

enum CoreDataStack {
  static let container: NSPersistentContainer = {
    let container = NSPersistentContainer(name: StringConstants.persistenceContainer)
    
    container.loadPersistentStores { storeDescription, error in
      if let error = error {
        fatalError("Error: unable to load persistent store: \(error): \(error.localizedDescription)")
      }
    }
    return container
  }()
  
  static var context: NSManagedObjectContext {
    container.viewContext
  }
  
  static func saveContext() {
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nsError = error as NSError
        fatalError("Error: unable to save context: \(nsError): \(nsError.localizedDescription)")
      }
    }
  }
}
