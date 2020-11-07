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
    
    func retrieveFolder(id: FolderId) throws -> Folder? {
        return try Folder.fetchOne(id: id)
    }
    
    //folderController.updateFolder(id: updateFolderId, title: updatedTitle)
    
//    func updateFolder(id: TodoId, title: String? = nil, order: Int? = nil, title: String? = nil, folderType: String) {
        
//    }
    
}
