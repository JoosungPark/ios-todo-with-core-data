//
//  Folder+CoreDataClass.swift
//  Todo
//
//  Created by 박주성 on 7/18/20.
//  Copyright © 2020 sdop. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Folder)
public class Folder: NSManagedObject {
    @NSManaged public var id: Int
    @NSManaged public var order: Int
    @NSManaged public var title: String!
    @NSManaged public var isOpened: Bool
    @NSManaged public var todos: NSMutableOrderedSet
    @NSManaged var folderTypeValue: String
}

