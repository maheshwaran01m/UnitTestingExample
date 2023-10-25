//
//  UITestingViewModel.swift
//  UnitTestingExample
//
//  Created by MAHESHWARAN on 25/10/23.
//

import SwiftUI

class UITestingViewModel: ObservableObject {
  
  @Published var textValue = String()
  @Published var isSignedIn: Bool
  
  let placeholderText = "Enter your name.."
  
  init(_ isSignedIn: Bool = false) {
    self.isSignedIn = isSignedIn
  }
  
  func signUp() {
    guard !textValue.isEmpty else { return }
    isSignedIn = true
  }
}
