//
//  ContentView.swift
//  UnitTestingExample
//
//  Created by MAHESHWARAN on 24/10/23.
//

import SwiftUI

struct ContentView: View {
  
  @StateObject private var viewModel: ContentViewModel
  
  init(_ isPremium: Bool = false) {
    _viewModel = .init(wrappedValue: .init(isPremium: isPremium))
  }
  
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
