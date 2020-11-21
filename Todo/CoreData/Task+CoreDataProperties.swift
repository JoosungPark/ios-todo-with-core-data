//
//  Task+CoreDataProperties.swift
//  Todo
//
//  Created by 박주성 on 7/18/20.
//  Copyright © 2020 sdop. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: Task.entityName)
    }

}

extension Task: EntityNamePresentable {
    static var entityName: String {
        get { return "Todo" }
    }
}

public extension Task {
    var status: TaskStatus {
        get {
            TaskStatus(rawValue: statusValue)!
        }
        set {
            statusValue = newValue.rawValue
        }
    }
}


public extension Task {
    class func clear() {
        let context = CoreDataManager.shared.managedContext
        let fetch: NSFetchRequest<Task> = Task.fetchRequest()
        
        try! context.fetch(fetch).forEach({ context.delete( $0) })
    }
}
