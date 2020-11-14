//
//  Todo+CoreDataProperties.swift
//  Todo
//
//  Created by 박주성 on 7/18/20.
//  Copyright © 2020 sdop. All rights reserved.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: Todo.entityName)
    }

}

extension Todo: EntityNamePresentable {
    static var entityName: String {
        get { return "Todo" }
    }
}


public extension Todo {
    class func clear() {
        let context = CoreDataManager.shared.managedContext
        let fetch: NSFetchRequest<Todo> = Todo.fetchRequest()
        
        try! context.fetch(fetch).forEach({ context.delete( $0) })
    }
}
