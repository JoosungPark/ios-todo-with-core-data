//
//  TodoTests.swift
//  TodoTests
//
//  Created by 박주성 on 7/18/20.
//  Copyright © 2020 sdop. All rights reserved.
//

import XCTest
@testable import Todo

class TodoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFolderCRUD() throws {
        // singleton보다 객체 생성 후 사용하는 게 side effect을 없도록 보장하는 측면에서 좋다.
        let folderController = FolderController()
        let testFolder1 = "testFolder1"
        
        let resultTestFolder1: Folder = folderController.createFolder(title: testFolder1)

        XCTAssertEqual(resultTestFolder1.title, testFolder1)
        XCTAssertEqual(resultTestFolder1.order, 1)
        
        // retrieve
        let testFolderId = 1
        let retrievedFolder: Folder? = folderController.retrieveFolder(id: testFolderId)
        
        XCTAssertNotNil(retrievedFolder)
        XCTAssertEqual(retrievedFolder.id, testFolderId)
        
        let testNilableFolderId = 0
        let nilableFolder: Folder? = folderController.retrieveFolder(id: testNilableFolderId)
        XCTAssertNil(nilableFolder)
        
    }
}
