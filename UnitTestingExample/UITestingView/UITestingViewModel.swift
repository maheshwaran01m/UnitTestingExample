//
//  UITestingViewModel.swift
//  UnitTestingExample
//
//  Created by MAHESHWARAN on 25/10/23.
//

import SwiftUI

class UITestingViewModel: ObservableObject {
  
  @Published var textValue = String()
  @Published var isSignedIn = false

  
  let placeholderText = "Enter your name.."
  
  
  func signUp() {
    guard !textValue.isEmpty else { return }
    isSignedIn = true
  }
}
