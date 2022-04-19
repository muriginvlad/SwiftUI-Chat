//
//  ChatController.swift
//  SwiftUI Chat
//
//  Created by Nick Halavins on 6/7/19. Updated 10/11/19
//  Copyright © 2019 AntiLand. All rights reserved.
//
import Combine
import SwiftUI


class ChatUtility : ObservableObject {

    @Published var messages = [
        ChatMessage(id: 1, message: "Hello world", avatar: "A", color: .red),
        ChatMessage(id: 2, message: "Hi", avatar: "B", color: .blue)
    ]
    
    func sendMessage(_ chatMessage: ChatMessage) {
        messages.append(chatMessage)
    }
    
    func deleteMessage(index: Int) {
        messages.remove(at: index)
    }
}
