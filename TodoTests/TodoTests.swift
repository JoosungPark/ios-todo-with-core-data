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
    private var folderController: FolderController {
        get {
            return FolderController()
        }
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateFolder() throws {
        let testFolder1 = "testFolder1"
        let resultTestFolder1: Folder = folderController.createFolder(title: testFolder1)

        XCTAssertEqual(resultTestFolder1.title, testFolder1)
        XCTAssertEqual(resultTestFolder1.order, 1)
    }
    
    func testReadFolder() throws {
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
    }
    
    func testUpdateFolder() throws {
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
    }
    
    // 다음 주에
    // delete 관련 코드는 제가 작성하고 추후 검수만 하고
    // Todo도 테스트 코드를 추가해 온다.
    
    // 개괄적인 건 작성해올 게용
    // Todo와 Folder를 같이 테스트하는 건 다음 스터디에서 하자
}
