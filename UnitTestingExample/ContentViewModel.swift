//
//  ContentViewModel.swift
//  UnitTestingExample
//
//  Created by MAHESHWARAN on 24/10/23.
//

import SwiftUI

class ContentViewModel: ObservableObject {
  
  @Published var isPremium: Bool
  
  init(isPremium: Bool) {
    self.isPremium = isPremium
  }
}
