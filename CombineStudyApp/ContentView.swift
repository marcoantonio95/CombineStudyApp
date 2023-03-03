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
                    NavigationLink(destination: FirstSampleView(), isActive: $firstLink) {
                        Button(action: {
                            self.firstLink = self.isSwiftUIMode ? true : false
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

                    NavigationLink(destination: SecondSampleView(), isActive: $secondLink) {
                        Button(action: {
                            self.secondLink = self.isSwiftUIMode ? true : false
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

                    NavigationLink(destination: ThirdSampleView(), isActive: $thirdLink) {
                        Button(action: {
                            self.thirdLink = self.isSwiftUIMode ? true : false
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
