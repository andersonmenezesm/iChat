//
//  ContentView.swift
//  iChat
//
//  Created by Anderson Menezes on 07/07/22.
//

import SwiftUI

struct ContentView: View {
  @StateObject var messagesManager = MessageManager()
  var messagesArray = ["Hello you", "How are you doing?", "I've been building SwiftUI applications from scratch and it's so much fun!"]
  
  var body: some View {
    VStack {
      VStack {
        TitleRow()
        
        ScrollView {
          ForEach(messagesManager.messages, id: \.id) { message in
            MessageBubble(message: message)
          }
        }
        .padding(.top, 10)
        .background(.white)
        .cornerRadius(30, corners: [.topLeft, .topRight])
      }
      .background(Color("Peach"))
      
      MessageField()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
      ContentView()
  }
}
