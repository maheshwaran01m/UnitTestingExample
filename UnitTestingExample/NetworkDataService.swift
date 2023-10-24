//
//  NetworkDataService.swift
//  UnitTestingExample
//
//  Created by MAHESHWARAN on 24/10/23.
//

import SwiftUI
import Combine

protocol NetworkDataServiceProtocol {
  func downloadItems(_ completion: @escaping ([String]) -> ())
  func downloadItemsWithCombine() -> AnyPublisher<[String], Error>
}

class NetworkDataService: NetworkDataServiceProtocol {
  
  func downloadItems(_ completion: @escaping ([String]) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      let items = (0...100).map { String($0) }
      completion(items)
    }
  }
  
  func downloadItemsWithCombine() -> AnyPublisher<[String], Error> {
    let items = (0...100).map { String($0) }
    
    return Just(items)
      .throttle(for: 3, scheduler: DispatchQueue.main, latest: true)
      .tryMap { 
        guard !$0.isEmpty else { throw URLError(.notConnectedToInternet) }
        return $0
      }
      .eraseToAnyPublisher()
  }
}
