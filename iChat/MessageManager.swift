//
//  MessageManager.swift
//  iChat
//
//  Created by Anderson Menezes on 09/07/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessageManager: ObservableObject {
  @Published private(set) var messages: [Message] = []
  let db = Firestore.firestore()
  
  init() {
    getMessages()
  }
  
  func getMessages() {
    db.collection("messages").addSnapshotListener { querySnapshot, error in
      guard let documents = querySnapshot?.documents else {
        print("Error fetching documents: \(String(describing: error))")
        return
      }
      
      self.messages = documents.compactMap { document -> Message? in
        do {
          return try document.data(as: Message.self)
        } catch {
          print("Error decoding document into Message: \(error)")
          return nil
        }
        
      }
    }
  }
}
