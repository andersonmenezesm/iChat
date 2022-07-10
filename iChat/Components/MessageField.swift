//
//  MessageField.swift
//  iChat
//
//  Created by Anderson Menezes on 08/07/22.
//

import SwiftUI

struct MessageField: View {
  @State private var message = ""
  
  var body: some View {
    HStack {
      CustomTextField(placeholder: Text("Enter your message here"), text: $message)
      
      Button {
        print("Message sent!")
        message = ""
      } label: {
          Image(systemName: "paperplane.fill")
          .foregroundColor(.white)
          .padding(10)
          .background(Color("Peach"))
          .cornerRadius(30)
      }
    }
    .padding(.horizontal)
    .padding(.vertical, 10)
    .background(Color("Gray"))
    .cornerRadius(20)
    .padding()
  }
}

struct MessageField_Previews: PreviewProvider {
  static var previews: some View {
      MessageField()
  }
}

struct CustomTextField: View {
  var placeholder: Text
  @Binding var text: String
  var editingChanged: (Bool) -> () = {_ in}
  var commit: () -> () = {}
  
  var body: some View {
    ZStack(alignment: .leading) {
      if text.isEmpty {
        placeholder
          .opacity(0.5)
      }
      
      TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
    }
  }
}
