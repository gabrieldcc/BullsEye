//
//  ViewControllerTests.swift
//  BullsEyeAppTests
//
//  Created by Gabriel de Castro Chaves on 18/08/22.
//

import XCTest
@testable import BullsEyeApp

class ViewControllerTests: XCTestCase {

    let sut = ViewController()
    
    func testShouldBeGreaterThanZero() {
    let test = true
        func positiveNumber() -> Bool {
            (sut.differenceBetweenSliderAndTarget(slider: 100, target: 50) > 0)
        }
    XCTAssertEqual(test, positiveNumber())
        
    }
}
