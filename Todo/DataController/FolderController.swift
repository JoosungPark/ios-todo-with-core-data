//
//  FolderController.swift
//  Todo
//
//  Created by 박주성 on 10/24/20.
//  Copyright © 2020 sdop. All rights reserved.
//

import Foundation


struct FolderController {

    // 참고, https://stackoverflow.com/questions/27178211/how-to-make-a-function-operate-on-a-sequence-of-optional-values
    private func checkParamsAllNil<E, S: Sequence>(params: S) throws where S.Element == Optional<E> {
//        if params.filter({ $0 == nil }).count == 0 {
//            throw TodoError.invalidUpdatedValue
//        }
        // 향후 구현
    }
    
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
                      folderType: String? = nil) throws -> Folder {
        
        try checkParamsAllNil(params:  [title, order, isOpened, folderType])
        
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
        
        fatalError()
    }
    
}
