//
//  TodoCorePresentable.swift
//  Todo
//
//  Created by 박주성 on 11/15/20.
//  Copyright © 2020 sdop. All rights reserved.
//

import Foundation

struct TodoCorePresentable<Base> {
    let base: Base
    
    init (_ base: Base) {
        self.base = base
    }
}

protocol TodoCoreCompatible {
    associatedtype TodoCoreBase
    
    static var wrapper: TodoCorePresentable<TodoCoreBase>.Type { get }
    
    var predicates: [NSPredicate] { get }
}

extension TodoCoreCompatible {
    static var wrapper: TodoCorePresentable<Self>.Type {
        get {
            return TodoCorePresentable<Self>.self
        }
    }
    
    var wrapper: TodoCorePresentable<Self> {
        get {
            return TodoCorePresentable(self)
        }
    }
    
    var predicates: [NSPredicate] {
        get {
            return []
        }
    }
}


import class Foundation.NSObject

extension NSObject: TodoCoreCompatible { }
