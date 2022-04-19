//
//  ContentView.swift
//  SwiftUI Chat
//
//  Created by Nick Halavins on 6/7/19. Updated 10/11/19
//  Copyright © 2019 AntiLand. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State private var composedMessage: String = ""
    @State private var disabled = true
    @State private var scrollTarget: Int?
    
    @EnvironmentObject var chatController: ChatUtility
    @FocusState private var sendMessageToggle: Bool
    
    var body: some View {
        NavigationView {
            
            ScrollViewReader { value in
                VStack {
                    List {
                        ForEach(chatController.messages, id: \.self) { msg in
                            ChatRow(chatMessage: msg)
                            
                        }.onDelete { indexSet in
                            deleteMessage(at: indexSet)
                        }
                        .onChange(of: chatController.messages.count) { _ in
                            value.scrollTo(chatController.messages.last!, anchor: .bottom)
                        }
                    }
                    
                    HStack {
                        TextField("Message...", text: $composedMessage)
                            .frame(minHeight: CGFloat(30))
                            .focused($sendMessageToggle)
                            .submitLabel(.send)
                            .onSubmit {
                                sendMessage()
                            }
                            .onChange(of: composedMessage) { value in
                                disabled = value == "" ? true : false
                            }
                        
                        Button(action: sendMessage) {
                            Text("Send")
                        }
                        .disabled(disabled)
                        
                    }.frame(minHeight: CGFloat(50))
                     .padding()
                }
            } .navigationTitle("Messages")
        }
    }
    
    func sendMessage() {
        if composedMessage != "" {
            chatController.sendMessage(ChatMessage(id: chatController.messages.count + 1, message: composedMessage, avatar: "C", color: .green, isMe: true))
            sendMessageToggle = false
            composedMessage = ""
        }
    }
    
    func deleteMessage(at offsets: IndexSet)  {
        offsets.forEach { (i) in
            chatController.deleteMessage(index: i)
        }
    }
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ChatUtility())
    }
}
#endif
