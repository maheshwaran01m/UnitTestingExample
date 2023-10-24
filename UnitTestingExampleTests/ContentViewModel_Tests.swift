//
//  ContentViewModel_Tests.swift
//  UnitTestingExampleTests
//
//  Created by MAHESHWARAN on 24/10/23.
//

import XCTest
@testable import UnitTestingExample

final class ContentViewModel_Tests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  /// Content: ``isPremium``
  func test_ContentViewModelForIsPremium_shouldBeTrue() {
    // Given
    let isPremium = true
    // When
    let viewModel = ContentViewModel(isPremium: isPremium)
    
    // Then
    XCTAssertTrue(viewModel.isPremium)
  }
}
