//
//  ContentView.swift
//  CombineStudyApp
//
//  Created by Marco Antonio Oliveira on 01/03/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State var firstLink = false
    @State var secondLink = false
    @State var thirdLink = false
    @State var isSwiftUIMode = true

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 8.0) {
                Text("Home!")
                    .font(.title)
                    .bold()
                Text("Select an sample option:")
                VStack(spacing: 16.0) {
                    NavigationLink(destination:
                                    self.isSwiftUIMode ? AnyView(FirstSampleView()) : AnyView(FirstSampleRxSwiftViewController())
                                   , isActive: $firstLink) {
                        Button(action: {
                            self.firstLink = true
                        }) {
                            Capsule()
                                .fill(Color("primaryColor"))
                                .frame(height: 45, alignment: .trailing)
                                .padding(.horizontal, 16)
                                .overlay(
                                    VStack {
                                        Text("Input + label")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                    }
                                )
                        }
                    }
                    NavigationLink(destination:  self.isSwiftUIMode ? AnyView(SecondSampleView()) : AnyView(SecondSampleRxSwiftViewController()), isActive: $secondLink) {
                        Button(action: {
                            self.secondLink = true
                        }) {
                            Capsule()
                                .fill(Color("primaryColor"))
                                .frame(height: 45, alignment: .trailing)
                                .padding(.horizontal, 16)
                                .overlay(
                                    VStack {
                                        Text("Request + ImageView")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                    }
                                )
                        }
                    }

                    NavigationLink(destination:  self.isSwiftUIMode ? AnyView(ThirdSampleView()) : AnyView(ThirdSampleRxSwiftViewController()), isActive: $thirdLink) {
                        Button(action: {
                            self.thirdLink = true
                        }) {
                            Capsule()
                                .fill(Color("primaryColor"))
                                .frame(height: 45, alignment: .trailing)
                                .padding(.horizontal, 16)
                                .overlay(
                                    VStack {
                                        Text("Request + TableView")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                    }
                                )
                        }
                    }
                }

                Toggle("Show SwiftUi samples", isOn: $isSwiftUIMode)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("background"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
