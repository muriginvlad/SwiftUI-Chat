//
//  ChatRow.swift
//  SwiftUI Chat
//
//  Created by Vladislav on 19.04.2022.
//  Copyright © 2022 AntiChat, Inc. All rights reserved.
//

import SwiftUI

struct ChatRow : View {
    var chatMessage: ChatMessage

    var body: some View {

        Group {
            if !chatMessage.isMe {
                HStack {
                    Group {
                        Text(chatMessage.avatar)
                        Text(chatMessage.message)
                            .bold()
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(chatMessage.color)
                            .cornerRadius(10)
                    }
                }
            } else {
                HStack {
                    Group {
                        Spacer()
                        Text(chatMessage.message)
                            .bold()
                            .foregroundColor(Color.white)
                            .padding(10)
                            .background(chatMessage.color)
                        .cornerRadius(10)
                        Text(chatMessage.avatar)
                    }
                }
            }
        }
    }
}
