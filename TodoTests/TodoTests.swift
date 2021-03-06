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

    // // singleton보다 객체 생성 후 사용하는 게 side effect을 없도록 보장하는 측면에서 좋다.
    private var folderController: FolderController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        CoreDataManager.shared.clear()
        folderController = FolderController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFolderCRUD() throws {
        
        // create
        let testFolder1 = "testFolder1"
        let resultTestFolder1: Folder = folderController.createFolder(title: testFolder1)

        XCTAssertEqual(resultTestFolder1.title, testFolder1)
        XCTAssertEqual(resultTestFolder1.order, 1)
        
        
        // read
        let testFolderId = 1
        let retrievedFolder: Folder? = try! folderController.retrieveFolder(id: testFolderId)
        
        XCTAssertNotNil(retrievedFolder)
        XCTAssertEqual(retrievedFolder!.id, testFolderId)
        
        let testNilableFolderId = 0
        do {
            _ = try folderController.retrieveFolder(id: testNilableFolderId)
            XCTFail()
        } catch let error as TodoError {
            XCTAssertEqual(error, .itemNotFound)
        } catch {
            XCTFail()
        }
        
        
        // update
        let updateFolderId: FolderId = 1
        let updatedTitle = "updated Title"
        let updatedFolder: Folder = try! folderController.updateFolder(id: updateFolderId, title: updatedTitle)
        XCTAssertEqual(updatedFolder.title, updatedTitle)
        
        let failedUpdateFolderId = 0
        do {
            _ = try folderController.updateFolder(id: failedUpdateFolderId, title: updatedTitle)
            XCTFail()
        } catch let error as TodoError {
            XCTAssertEqual(error, .itemNotFound)
        } catch {
            XCTFail()
        }
        
        
        // delete
        let failedDeleteFolderId: FolderId = 2
        do {
            try folderController.deleteFolder(id: failedDeleteFolderId)
            XCTFail()
        } catch let error as TodoError {
            XCTAssertEqual(error, .itemNotFound)
        } catch {
            XCTFail()
        }
        
        let deleteFolderId: FolderId = 1
        do {
            try folderController.deleteFolder(id: deleteFolderId)
        } catch {
            XCTFail()
        }
    }
}
