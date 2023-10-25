//
//  ContentViewModel.swift
//  UnitTestingExample
//
//  Created by MAHESHWARAN on 24/10/23.
//

import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
  
  @Published var isPremium: Bool
  @Published var records = [String]()
  @Published var selectedItem: String?
  
  let dataServices: NetworkDataServiceProtocol
  var cancelBag = Set<AnyCancellable>()
  
  init(isPremium: Bool,
       dataServices: NetworkDataServiceProtocol = NetworkDataService()) {
    self.isPremium = isPremium
    self.dataServices = dataServices
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
  
  func save(_ item: String) throws {
    guard !item.isEmpty else { throw DataError.noData }

    guard let value = records.first(where: { $0 == item }), value.isEmpty else {
      throw DataError.itemNotFound
    }
    debugPrint("Save Item \(value)")
  }
  
  enum DataError: LocalizedError {
    case noData, itemNotFound
  }
  
  func downloadItems() {
    dataServices.downloadItems { [weak self] records in
      guard let self else { return }
      self.records = records
    }
  }
  
  func downloadItemsUsingCombine() {
    dataServices.downloadItemsWithCombine()
      .sink { _ in
        
      } receiveValue: { [weak self] values in
        self?.records = values
      }
      .store(in: &cancelBag)
  }
}
