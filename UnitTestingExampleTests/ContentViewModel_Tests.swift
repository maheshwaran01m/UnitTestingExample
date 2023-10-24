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
  
  var viewModel: ContentViewModel?
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    viewModel = ContentViewModel(isPremium: .random())
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    viewModel = nil
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
    guard let viewModel else { return }
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
    guard let viewModel else { return }
    // When
    viewModel.add("")
    
    // Then
    XCTAssertTrue(viewModel.records.isEmpty)
  }
  
  /// `Check` ``SelectedItem``
  func test_SelectedItem_isNil() {
    guard let viewModel else { return }
    
    XCTAssertTrue(viewModel.selectedItem == nil)
    XCTAssertNil(viewModel.selectedItem)
  }
  
  func test_selectedItem_ForInvalidItem() {
    guard let viewModel else { return }
    
    let value = UUID().uuidString
    viewModel.add(value)
    viewModel.selectedItem(value)
    
    viewModel.selectedItem(UUID().uuidString)
    
    XCTAssertNil(viewModel.selectedItem)
  }
  
  func test_selectedItem_stress() {
    guard let viewModel else { return }
    
    var records = [String]()
    for _ in 0..<50 {
      let value = UUID().uuidString
      viewModel.add(value)
      records.append(value)
    }
    let randomItem = records.randomElement() ?? ""
    viewModel.selectedItem(randomItem)
    
    XCTAssertNotNil(viewModel.selectedItem)
    XCTAssertEqual(viewModel.selectedItem, randomItem)
  }
  
  /// `Check:` ``Save Item``
  func test_saveData_withThrowError() {
    guard let viewModel else { return }
    
    XCTAssertThrowsError(try viewModel.save(""))
    
    XCTAssertThrowsError(
      try viewModel.save(UUID().uuidString),
      "Item Not found") { error in
        
        let error = error as? ContentViewModel.DataError
        XCTAssertEqual(error, ContentViewModel.DataError.itemNotFound)
      }
  }
}
