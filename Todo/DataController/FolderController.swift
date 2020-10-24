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
//        let folder = Folder()
        let folder = Folder.newInstance(title: title)
        folder.order = 1
        return folder
    }
}
