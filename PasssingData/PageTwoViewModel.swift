//
//  PageTwoViewModel.swift
//  PasssingData
//
//  Created by Shiva kumar Arya on 3/7/24.
//

import Foundation

enum ChatGptRespose: Error {
    case responseError
    case urlError
    case serverSideError
    case ClientSideError
}



class  PageTwoViewModel: ObservableObject {
    func laodDataFromChatGPT(inputFromPageOne: String) async throws -> ChatGptRespone {
        let endPoint = "https://chatgptvm.eastus.cloudapp.azure.com/api/chatgpt/\(inputFromPageOne)"
        guard let url = URL(string: endPoint) else {
            throw  ChatGptRespose.urlError
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw ChatGptRespose.responseError
        }
        let decoder = JSONDecoder()
        let chatGptResponse = try  decoder.decode(ChatGptRespone.self, from: data)
        return chatGptResponse
    }
}
