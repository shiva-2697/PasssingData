//
//  PageTwoView.swift
//  PasssingData
//
//  Created by Shiva kumar Arya on 3/5/24.
//

import SwiftUI

struct PageTwoView: View {
    
    @Binding var textTwo: String
    @State var response: ChatGptRespone?
    
    @StateObject private var viewModel = PageTwoViewModel()
    @State var isHidden = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .scaledToFit()
            Text(response?.message ?? "")
                .bold()
                .font(.title)
            ProgressView()
                .isHidden(isHidden)
        }
        .padding()
        .task {
            do {
                response = try await viewModel.laodDataFromChatGPT(inputFromPageOne: textTwo)
                isHidden = true
            } catch ChatGptRespose.responseError {
                print("Server Down")
            } catch ChatGptRespose.urlError {
                print("URL Error")
            } catch {
                print("Something went wrong", error)
            }
        }
    }
}

#Preview {
    PageTwoView(textTwo: .constant("Hello"))
}

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
