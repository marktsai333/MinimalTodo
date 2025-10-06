//
//  TLButton.swift
//  ToDoList
//
//  Created by 蔡宇炫 on 2024/2/1.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            // Action
            action()
        } label: {
            ZStack  {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        .padding(10)
    }
}

#Preview {
    TLButton (title: "Value", background: .pink) {
        // Action
    }
}

