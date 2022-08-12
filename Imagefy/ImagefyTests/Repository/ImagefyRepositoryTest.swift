//
//  ImagefyRepositoryTest.swift
//  ImagefyTests
//
//  Created by Lucca Beurmann on 12/08/22.
//

import XCTest
@testable import Imagefy

class ImagefyRepositoryTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShouldCallDataSourceForUserProfile() async throws {
        let dataSource = DataSourceMock()
        let repo = ImagefyRepository(dataSource)
        
        _ = await repo.getUserProfile(username: "username")
        
        XCTAssertEqual(1, dataSource.userProfileCalls)
    }
    
    func testShouldCallDataSourceForUserPhotos() async throws {
        let dataSource = DataSourceMock()
        let repo = ImagefyRepository(dataSource)
        
        _ = await repo.getUserPhotos(username: "username", page: 1)
        
        XCTAssertEqual(1, dataSource.profilePhotosCalls)
    }
    
    func testShouldCallDataSourceForFeedPhotos() async throws {
        let dataSource = DataSourceMock()
        let repo = ImagefyRepository(dataSource)
        
        _ = await repo.getFeedPhotos(page: 10)
        
        XCTAssertEqual(1, dataSource.listPhotoCalls)
    }

}
