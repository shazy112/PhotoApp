//
//  PhotosAppTests.swift
//  PhotosAppTests
//
//  Created by Shiraz Ahmed Khan on 06/07/2021.
//

import XCTest
@testable import PhotosApp

class PhotosAppTests: XCTestCase, PhotosResponseDelegate {
    var viewModel: PhotosViewModel?
    var expectation: XCTestExpectation? // 2
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    func testIfPhotosHaveValidURL() throws {
        // This test checks the webURL from which we fetch images in the App is actually a url or not.
        // If the fetched webURLs from api are valid urls our tests Passes, otherwise our test will fail
        // I have also added and commented a mock array to test weburls if we need to check it without API response
        
        //        let photos = [Photos.init(webformatURL: "https://www.google.com/"),
        //                      Photos.init(webformatURL: "/pixabay")]
        
        expectation = XCTestExpectation(description: "Fetching Images URL")
        viewModel = PhotosViewModel(delegate: self)
        if let excep = expectation {
            wait(for: [excep], timeout: 10.0)

        }
        
    }
    
    func success(photos: [Photos]) {
        photos.forEach { photo in
            let result = viewModel?.isConvertibleToURL(photo: photo)
            XCTAssertEqual(true, result)
            expectation?.fulfill()
        }
    }
    
    func failure(message: String) {
        XCTAssert(false)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
