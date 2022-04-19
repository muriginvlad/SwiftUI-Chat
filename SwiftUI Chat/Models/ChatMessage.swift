//
//  ChatMessage.swift
//  SwiftUI Chat
//
//  Created by Vladislav on 19.04.2022.
//  Copyright © 2022 AntiChat, Inc. All rights reserved.
//

import Foundation
import SwiftUI

struct ChatMessage : Hashable {
    var id: Int
    var message: String
    var avatar: String
    var color: Color
    var isMe: Bool = false
    
}
