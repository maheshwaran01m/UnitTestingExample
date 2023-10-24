//
//  ContentViewModel_Tests.swift
//  UnitTestingExampleTests
//
//  Created by MAHESHWARAN on 24/10/23.
//

import XCTest
@testable import UnitTestingExample

/// `Naming Structure:`  ``test_[name of class/struct]_[variable or method name]_[expected result]``
/// `Testing Structure` ``Given, When, Then``


final class ContentViewModel_Tests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  // MARK: - isPremium
  
  /// Check: ``isPremium``
  func test_ContentViewModelForIsPremium() {
    // Given
    let isPremium = Bool.random()
    // When
    let viewModel = ContentViewModel(isPremium: isPremium)
    
    // Then
//    XCTAssertTrue(viewModel.isPremium)
    XCTAssertEqual(viewModel.isPremium, isPremium)
  }
  
  func test_ContentViewModelForIsPremium_stress() {
    for _ in 0..<100 {
      // Given
      let isPremium = Bool.random()
      // When
      let viewModel = ContentViewModel(isPremium: isPremium)
      
      // Then
      XCTAssertEqual(viewModel.isPremium, isPremium)
    }
  }
  
  /// Check: ``Records``
  func test_ContentViewModel_addRecords() {
    // Given
    let viewModel = ContentViewModel(isPremium: .random())
    // When
    for _ in 0..<50 {
      viewModel.add(UUID().uuidString)
    }
    
    // Then
    XCTAssertEqual(viewModel.records.count, 50)
    XCTAssertGreaterThanOrEqual(viewModel.records.count, 0)
  }
  
  func test_ContentViewModel_addRecords_withNotBlankString() {
    // Given
    let viewModel = ContentViewModel(isPremium: .random())
    // When
    viewModel.add("")
    
    // Then
    XCTAssertTrue(viewModel.records.isEmpty)
  }
}
