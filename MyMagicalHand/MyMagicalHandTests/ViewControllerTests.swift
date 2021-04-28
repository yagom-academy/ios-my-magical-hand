//
//  ViewControllerTests.swift
//  MyMagicalHandTests
//
//  Created by 김호준 on 2021/04/28.
//

import XCTest
@testable import MyMagicalHand

class ViewControllerTests: XCTestCase {
    var sut: ViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = bringRootViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testController_whenStartApp_labelsAreHidden() {
        //then
        XCTAssertEqual(sut.looksLikeLabel.isHidden, true)
        XCTAssertEqual(sut.percentLabel.isHidden, true)
    }
}
