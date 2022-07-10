//
//  ContentView.swift
//  iChat
//
//  Created by Anderson Menezes on 07/07/22.
//

import SwiftUI

struct ContentView: View {
  @StateObject var messageManager = MessageManager()

  var body: some View {
    VStack {
      VStack {
        TitleRow()
        
        ScrollViewReader { proxy in
          ScrollView {
            ForEach(messageManager.messages, id: \.id) { message in
              MessageBubble(message: message)
            }
          }
          .padding(.top, 10)
          .background(.white)
          .cornerRadius(30, corners: [.topLeft, .topRight])
          .onChange(of: messageManager.lastMessageId) { id in
            withAnimation {
              proxy.scrollTo(id, anchor: .bottom)
            }
          }
        }
      }
      .background(Color("Peach"))
      
      MessageField()
        .environmentObject(messageManager)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
      ContentView()
  }
}
