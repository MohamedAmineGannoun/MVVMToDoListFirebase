//
//  LoginView.swift
//  toDoList
//
//  Created by Amine Gannoun on 26/03/2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, backgroundColor: .pink)
                                
                Form{
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                    SecureField("Password", text: $viewModel.password)
                    
                    TLButton(title: "Log In", 
                             background: .blue,
                             action: {
                        viewModel.login()
                    }).padding()
                    
                }.offset(y : -100)
                
                VStack{
                    Text("New around here ?")
                    
                    NavigationLink("Create An Account", destination: RegisterView())
                                        
                }.padding(.bottom, 50)
                
                Spacer()
            }
        }.toolbar(.hidden)
    }
}

#Preview {
    LoginView()
}
