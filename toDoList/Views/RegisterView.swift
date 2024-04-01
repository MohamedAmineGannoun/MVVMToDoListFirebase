//
//  RegisterView.swift
//  toDoList
//
//  Created by Amine Gannoun on 26/03/2024.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        
        VStack{
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, backgroundColor: .yellow)
        }
        
        Form{
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
            }
            
            TextField("Name", text: $viewModel.name)
            TextField("Email", text: $viewModel.email)
            SecureField("Password", text: $viewModel.password)
            
            TLButton(title: "Create Account", background: .green, action: {
                viewModel.register()
            }).padding()

        }.offset(y: -100)
        
        Spacer()
        
    }
}

#Preview {
    RegisterView()
}
