//
//  UnitTestingExampleApp.swift
//  UnitTestingExample
//
//  Created by MAHESHWARAN on 24/10/23.
//

import SwiftUI

@main
struct UnitTestingExampleApp: App {
  var isSignedIn: Bool
  
  init() {
    //    self.isSignedIn = CommandLine.arguments.contains("-UI_isSignedIn")
    //    self.isSignedIn = ProcessInfo.processInfo.arguments.contains("-UI_isSignedIn")
    //    self.isSignedIn = ProcessInfo.processInfo.environment["-UI_isSignedIn"] == "true"
    isSignedIn = false
  }
  
  var body: some Scene {
    WindowGroup {
      UITestingView(isSignedIn: isSignedIn)
    }
  }
}
