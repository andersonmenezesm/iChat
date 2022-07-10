//
//  iChatApp.swift
//  iChat
//
//  Created by Anderson Menezes on 07/07/22.
//

import SwiftUI
import FirebaseCore

@main
struct iChatApp: App {
  
  init() {
    FirebaseApp.configure()
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
