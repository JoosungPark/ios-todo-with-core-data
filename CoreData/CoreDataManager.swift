//
//  CoreDataManager.swift
//  Todo
//
//  Created by 박주성 on 2020/08/06.
//  Copyright © 2020 sdop. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataManager {
    
    public static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Todo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    public var managedContext: NSManagedObjectContext {
        get {
            return persistentContainer.viewContext
        }
    }
    
    public func saveContext () {
        let context = CoreDataManager.shared.managedContext
        if context.hasChanges {
            do {
                try context.save()
            } catch let error as NSError {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
