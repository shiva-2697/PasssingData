//
//  PageTwoView.swift
//  PasssingData
//
//  Created by Shiva kumar Arya on 3/5/24.
//

import SwiftUI

struct PageTwoView: View {
    
    @Binding var textTwo: String
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .scaledToFit()
            AsyncImage(url: URL(string: textTwo)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 600, height: 300)
            } placeholder: {
                ProgressView()
            }
            NavigationLink(destination: PageThreeView(textThree: $textTwo)) {
                Label("View Image in Full size", systemImage: "rectange.potrait.and.arrow.forward")
                    .font(.headline)
                    .foregroundColor(.accentColor)
            }
        }
        .padding()
    }
}

#Preview {
    PageTwoView(textTwo: .constant(""))
}
