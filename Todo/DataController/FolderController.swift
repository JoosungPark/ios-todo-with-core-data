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
    
    func updateFolder(id: TodoId,
                      title: String? = nil,
                      order: Int? = nil,
                      isOpened: Bool? = nil,
                      folderType: FolderType? = nil) throws -> Folder {
     
        try checkParamsAllNil(params:  [title, order, isOpened, folderType])
        if title == nil && order == nil && isOpened == nil && folderType == nil {
            throw TodoError.invalidUpdatedValue
        }
        guard let folder = try retrieveFolder(id: id) else { throw TodoError.itemNotFound }
        if let title = title {
            folder.title = title
        }
        if let order = order {
            folder.order = order
        }
        if let isOpened = isOpened {
            folder.isOpened = isOpened
        }
        if let folderType = folderType {
            folder.folderType = folderType
        }
        
        return folder
    }
    
    func deleteFolder(id: TodoId) throws {
        try Folder.delete(id: id)
    }
}


private extension FolderController {
    private func checkParamsAllNil(params: [Any?]) throws {
        if params.filter({ $0 == nil }).count == 0 {
            throw TodoError.invalidUpdatedValue
        }
    }
}
