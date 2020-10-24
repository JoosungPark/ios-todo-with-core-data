//
//  FolderController.swift
//  Todo
//
//  Created by 박주성 on 10/24/20.
//  Copyright © 2020 sdop. All rights reserved.
//

import Foundation


struct FolderController {
    
    func createFolder(title: String) -> Folder {
        let folder = Folder.newInstance(title: title)
        folder.id = 1
        folder.order = 1
        return folder
    }
    
    func retrieveFolder(id: FolderId) -> Folder? {
        do {
            return try Folder.fetchOne(id: id)
        } catch let error as NSError {
            print("failed to retrieveFolder: at FolderController \(error) \(error.userInfo)")
            return nil
        }
    }
    
    
}
