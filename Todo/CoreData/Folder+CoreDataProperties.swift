//
//  Folder+CoreDataProperties.swift
//  Todo
//
//  Created by 박주성 on 7/18/20.
//  Copyright © 2020 sdop. All rights reserved.
//
//

import Foundation
import CoreData


extension Folder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Folder> {
        return NSFetchRequest<Folder>(entityName: Folder.entityName)
    }

}

extension Folder: EntityNamePresentable {
    static var entityName: String {
        get { return "Folder" }
    }
}

public extension Folder {
    var folderType: FolderType {
        get {
            return FolderType(rawValue: self.folderTypeValue)!
        }

        set {
            self.folderTypeValue = newValue.rawValue
        }
    }
}

public extension Folder {
    class func newInstance(title: String) -> Folder {
        let context = CoreDataManager.shared.managedContext
        let entity = NSEntityDescription.entity(forEntityName: Folder.entityName, in: context)!
        let data = NSManagedObject(entity: entity, insertInto: context) as! Folder
        data.title = title
        return data
    }
    
    class func fetchOne(id: FolderId) throws -> Folder?  {
        let manager = CoreDataManager.shared
        let context = manager.managedContext
        
        let fetch: NSFetchRequest<Folder> = Folder.fetchRequest()
        fetch.predicate = NSPredicate(format: "%K == %lld", #keyPath(Folder.id), id)
        
        return try context.fetch(fetch).first
    }
}




// MARK: Generated accessors for todos
extension Folder {

    @objc(insertObject:inTodosAtIndex:)
    @NSManaged public func insertIntoTodos(_ value: Todo, at idx: Int)

    @objc(removeObjectFromTodosAtIndex:)
    @NSManaged public func removeFromTodos(at idx: Int)

    @objc(insertTodos:atIndexes:)
    @NSManaged public func insertIntoTodos(_ values: [Todo], at indexes: NSIndexSet)

    @objc(removeTodosAtIndexes:)
    @NSManaged public func removeFromTodos(at indexes: NSIndexSet)

    @objc(replaceObjectInTodosAtIndex:withObject:)
    @NSManaged public func replaceTodos(at idx: Int, with value: Todo)

    @objc(replaceTodosAtIndexes:withTodos:)
    @NSManaged public func replaceTodos(at indexes: NSIndexSet, with values: [Todo])

    @objc(addTodosObject:)
    @NSManaged public func addToTodos(_ value: Todo)

    @objc(removeTodosObject:)
    @NSManaged public func removeFromTodos(_ value: Todo)

    @objc(addTodos:)
    @NSManaged public func addToTodos(_ values: NSOrderedSet)

    @objc(removeTodos:)
    @NSManaged public func removeFromTodos(_ values: NSOrderedSet)

}
