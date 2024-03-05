//
//  ContentView.swift
//  PasssingData
//
//  Created by Shiva kumar Arya on 3/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var textOne: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "hands.clap")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                TextField("Please enter the Image url here", text: $textOne)
                    .border(.secondary)
                    .padding()
                NavigationLink(destination: PageTwoView(textTwo: $textOne)) {
                    Label("View Image", systemImage: "rectange.potrait.and.arrow.forward")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
