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
        HomeScreenView()
      } else {
        VStack {
          TextField(viewModel.placeholderText, text: $viewModel.textValue)
            .textFieldStyle(.roundedBorder)
            .font(.headline)
            .padding()
            .accessibilityIdentifier("SignUpTextField")
          
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
              .accessibilityIdentifier("SignUpButton")
          }
        }
        .transition(.move(edge: .leading))
      }
    }
  }
}

private struct HomeScreenView: View {
  
  @State private var showAlert: Bool = false
  
  var body: some View {
    NavigationStack {
      
      VStack(spacing: 20) {
        
        Button {
          showAlert.toggle()
        } label: {
          Text("Show Alert")
            .font(.headline)
            .padding()
            .padding(.horizontal)
            .background(Color.red.opacity(0.5))
            .clipShape(Capsule())
            .accessibilityIdentifier("Show Alert Button")
        }
        .alert("Welcome To UI Testing", isPresented: $showAlert) {}
        
        NavigationLink {
          Text("Destination")
            .font(.headline)
            .padding()
            .padding(.horizontal)
            .background(Color.green.opacity(0.5))
            .clipShape(Capsule())
        } label: {
          Text("Navigate")
            .font(.headline)
            .padding()
            .padding(.horizontal)
            .background(Color.green.opacity(0.5))
            .clipShape(Capsule())
            .accessibilityIdentifier("SignUpTextField")
        }
        
      }
      .navigationTitle("Home")
    }
  }
}

#Preview {
  UITestingView()
}
