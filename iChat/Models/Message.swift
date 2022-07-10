//
//  Message.swift
//  iChat
//
//  Created by Anderson Menezes on 07/07/22.
//

import Foundation

struct Message: Identifiable, Codable {
  var id: String
  var text: String
  var received: Bool
  var timestamp: Date
}
