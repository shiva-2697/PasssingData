//
//  PageThreeView.swift
//  PasssingData
//
//  Created by Shiva kumar Arya on 3/5/24.
//

import SwiftUI

struct PageThreeView: View {
    
    @Binding var textThree: String
    
    var body: some View {
        VStack {
            Image(systemName: "photo.artframe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            AsyncImage(url: URL(string: textThree)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 1200, height: 600)
            } placeholder: {
                ProgressView()
            }
  
        }
        .padding()
    }
}

#Preview {
    PageThreeView(textThree: .constant("Full View"))
}
