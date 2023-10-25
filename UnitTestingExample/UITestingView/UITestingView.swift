//
//  UITestingView.swift
//  UnitTestingExample
//
//  Created by MAHESHWARAN on 25/10/23.
//

import SwiftUI

struct UITestingView: View {
  
  @StateObject private var viewModel = UITestingViewModel()
  
  var body: some View {
    ZStack {
      LinearGradient(colors: [.blue.opacity(0.1), .blue.opacity(0.5)],
                     startPoint: .topLeading,
                     endPoint: .bottomTrailing)
      .ignoresSafeArea()
      
      signUpView
    }
  }
  
  private var signUpView: some View {
    ZStack {
      if viewModel.isSignedIn {
        
        Text("Hello Welcome")
          .font(.headline)
          .padding()
          .padding(.horizontal)
          .background(Color.green.opacity(0.5))
          .clipShape(Capsule())
          .transition(.move(edge: .trailing))
      
      } else {
        VStack {
          TextField(viewModel.placeholderText, text: $viewModel.textValue)
            .textFieldStyle(.roundedBorder)
            .font(.headline)
            .padding()
          
          Button {
            withAnimation(.spring()) {
              viewModel.signUp()
            }
          } label: {
            Text("Sign Up")
              .font(.headline)
              .padding()
              .padding(.horizontal)
              .background(Color.green.opacity(0.5))
              .clipShape(Capsule())
          }
        }
        .transition(.move(edge: .leading))
      }
    }
  }
  
  private func homeView() -> some View {
    Text("Hello World")
  }

}

#Preview {
  UITestingView()
}
