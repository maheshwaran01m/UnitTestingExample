//
//  UITestingView_UITest.swift
//  UnitTestingExample_UITests
//
//  Created by MAHESHWARAN on 25/10/23.
//

import XCTest

/// `Naming Structure:` ``test_UnitOfWork_StateUnderTest_ExpectedBehaviour``
/// `Naming Structure:`  ``test_[name of class/struct]_[variable or method name]_[expected result]``
/// `Testing Structure` ``Given, When, Then``

final class UITestingView_UITest: XCTestCase {
  
  let app = XCUIApplication()
  
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
//    app.launchArguments = ["-UI_isSignedIn"]
//    app.launchEnvironment = ["-UI_isSignedIn": "true"]
    app.launch()
  }
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() throws {
    // UI tests must launch the application that they test.
    app.launch()
    
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testLaunchPerformance() throws {
    if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
      // This measures how long it takes to launch your application.
      measure(metrics: [XCTApplicationLaunchMetric()]) {
        XCUIApplication().launch()
      }
    }
  }
  
  /// `check:` ``UITestingView``
  func test_UITestingView_signUpButton_ShouldNotSignIn() {
    // Given
    let textField = app.textFields["SignUpTextField"]
    
    // when
    textField.tap()
    
    let returnButton = app.buttons["Return"]
    returnButton.tap()
    
    let signUpButton = app.buttons["SignUpButton"]
    signUpButton.tap()
    
    let navigationBar = app.navigationBars["Home"]
    
    // Then
    XCTAssertFalse(navigationBar.exists)
  }
  
  func test_UITestingView_signUpButton_ShouldSignIn() {
    // Given
    let textField = app.textFields["SignUpTextField"]
    
    // when
    textField.tap()
    
    let keyA = app.keys["A"]
    keyA.tap()
    
    let keya = app.keys["a"]
    keya.tap()
    keya.tap()
    keya.tap()
    
    let returnButton = app.buttons["Return"]
    returnButton.tap()
    
    let signUpButton = app.buttons["SignUpButton"]
    signUpButton.tap()
    
    let navigationBar = app.navigationBars["Home"]
    
    // Then
    XCTAssertTrue(navigationBar.exists)
  }
  
  /// `Check:` ``HomeScreenView``
  func test_signedInHomeView_showAlertButton_displayAlert() {
    // Given
    let textField = app.textFields["SignUpTextField"]
    
    // when
    textField.tap()
    
    let keyA = app.keys["A"]
    keyA.tap()
    
    let keya = app.keys["a"]
    keya.tap()
    keya.tap()
    keya.tap()
    
    let returnButton = app.buttons["Return"]
    returnButton.tap()
    
    let signUpButton = app.buttons["SignUpButton"]
    signUpButton.tap()
    
    let navigationBar = app.navigationBars["Home"]
    
    XCTAssertTrue(navigationBar.exists)
    
    let alertButton = app.buttons["Show Alert Button"]
    alertButton.tap()
    
    let alert = app.alerts.firstMatch //["Welcome To UI Testing"]
    
    // Then
    XCTAssertTrue(alert.exists)
  }
  
  func test_signedInHomeView_showAlertButton_displayAlertAndDismiss() {
    // Given
    let textField = app.textFields["SignUpTextField"]
    
    // when
    textField.tap()
    
    let keyA = app.keys["A"]
    keyA.tap()
    
    let keya = app.keys["a"]
    keya.tap()
    keya.tap()
    keya.tap()
    
    let returnButton = app.buttons["Return"]
    returnButton.tap()
    
    let signUpButton = app.buttons["SignUpButton"]
    signUpButton.tap()
    
    let navigationBar = app.navigationBars["Home"]
    
    XCTAssertTrue(navigationBar.exists)
    
    let alertButton = app.buttons["Show Alert Button"]
    alertButton.tap()
    
    let alert = app.alerts.firstMatch //["Welcome To UI Testing"]
    XCTAssertTrue(alert.exists)
    
    let alertOkButton = alert.buttons["OK"]
    alertOkButton.tap()
    
    // sleep(1)
    if alertOkButton.waitForExistence(timeout: 2) {
      // Then
      XCTAssertFalse(alert.exists)
    }
  }
  
  /// `Check:` ``Navigation Destination``
  func test_singedInHomeView_navigationLinkToDestination_shouldNavigationToDestination() {
    // Given
    let textField = app.textFields["SignUpTextField"]
    
    // when
    textField.tap()
    
    let keyA = app.keys["A"]
    keyA.tap()
    
    let keya = app.keys["a"]
    keya.tap()
    keya.tap()
    keya.tap()
    
    let returnButton = app.buttons["Return"]
    returnButton.tap()
    
    let signUpButton = app.buttons["SignUpButton"]
    signUpButton.tap()
    
    let navigationBar = app.navigationBars["Home"]
    XCTAssertTrue(navigationBar.exists)
    
    let navigate = app.buttons["Navigate"]
    navigate.tap()
    
    //Then
    let destination = app.staticTexts["Destination"]
    XCTAssertTrue(destination.exists)
  }
  
  func test_signedInHomeView_navigationLinkToDestination_shouldNavigationToDestinationBack() {
    // Given
    let textField = app.textFields["SignUpTextField"]
    
    // when
    textField.tap()
    
    let keyA = app.keys["A"]
    keyA.tap()
    
    let keya = app.keys["a"]
    keya.tap()
    keya.tap()
    keya.tap()
    
    let returnButton = app.buttons["Return"]
    returnButton.tap()
    
    let signUpButton = app.buttons["SignUpButton"]
    signUpButton.tap()
    
    let navigationBar = app.navigationBars["Home"]
    XCTAssertTrue(navigationBar.exists)
    
    let navigate = app.buttons["Navigate"]
    navigate.tap()
    
    let destination = app.staticTexts["Destination"]
    XCTAssertTrue(destination.exists)
    
    let backButton = app.navigationBars.buttons["Home"]
    backButton.tap()
    
    //Then
    XCTAssertTrue(navigationBar.exists)
  }
  
  func test_alreadySingedInState_navigationLinkToDestination_shouldNavigationToDestinationBack() {
    let navigationBar = app.navigationBars["Home"]
    XCTAssertTrue(navigationBar.exists)
    
    let navigate = app.buttons["Navigate"]
    navigate.tap()
    
    let destination = app.staticTexts["Destination"]
    XCTAssertTrue(destination.exists)
    
    let backButton = app.navigationBars.buttons["Home"]
    backButton.tap()
    
    //Then
    XCTAssertTrue(navigationBar.exists)
  }
}
