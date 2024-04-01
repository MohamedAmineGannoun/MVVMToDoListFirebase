//
//  TLButton.swift
//  toDoList
//
//  Created by Amine Gannoun on 26/03/2024.
//

import SwiftUI

struct TLButton: View {
    
    let title : String
    let background : Color
    let action : () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Title", background: .blue, action: {})
}
