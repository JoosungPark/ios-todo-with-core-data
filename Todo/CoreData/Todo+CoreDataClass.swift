//
//  Todo+CoreDataClass.swift
//  Todo
//
//  Created by 박주성 on 7/18/20.
//  Copyright © 2020 sdop. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Todo)
public class Todo: NSManagedObject {
    @NSManaged public var id: Int64
    @NSManaged public var title: String!
    @NSManaged public var desc: String?
    @NSManaged public var createdAt: Date!
    @NSManaged public var updatedAt: Date?
    @NSManaged public var dueDate: Date?
    @NSManaged public var closedAt: Date?
    @NSManaged public var status: String!
    @NSManaged public var parentId: Int64
    @NSManaged public var todoIds: [Int64]
    @NSManaged public var order: Int64
    @NSManaged public var folder: Folder!
}
