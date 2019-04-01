//
//  NewsViewModelTest.swift
//  BBCTests
//
//  Created by GlobalTMS on 22/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import XCTest

@testable import BBC

class NewsViewModelTest: XCTestCase {
    
    var viewModel: NewsViewModelProtocol = NewsViewModel()
    let mockNewsRepository = MockNewsRepository()
    
    override func setUp() {
        mockNewsRepository.getNews { (news) in
            self.viewModel.news = news
        }
    }
    
    func testGetNews() {
        XCTAssertNotNil(viewModel.news)
    }
    
    func testGetNewsCount() {
        let newsCount = viewModel.getNewsCount()
        XCTAssertTrue(newsCount > 0)
    }
    
    func testGetNew() {
        let new = viewModel.getNew(0)
        XCTAssertNotNil(new)
    }
    

}
