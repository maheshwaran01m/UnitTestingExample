//
//  ContentViewModel.swift
//  UnitTestingExample
//
//  Created by MAHESHWARAN on 24/10/23.
//

import SwiftUI

class ContentViewModel: ObservableObject {
  
  @Published var isPremium: Bool
  @Published var records = [String]()
  @Published var selectedItem: String?
  
  init(isPremium: Bool) {
    self.isPremium = isPremium
  }
  
  func add(_ item: String) {
    guard !item.isEmpty else { return }
    records.append(item)
  }
  
  func selectedItem(_ item: String) {
    guard let value = records.first(where: { $0 == item }) else {
      selectedItem = nil
      return
    }
    selectedItem = value
  }
}
