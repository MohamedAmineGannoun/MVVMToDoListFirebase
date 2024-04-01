//
//  ProfileView.swift
//  toDoList
//
//  Created by Amine Gannoun on 26/03/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView(content: {
            VStack{
                
                if let user = viewModel.user {
                    
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 125)
                        .padding()
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("Name: ")
                            Text(user.name)
                        }
                        HStack{
                            Text("Email: ")
                            Text(user.email)
                        }
                        HStack{
                            Text("Member since: ")
                            Text(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))
                        }
                    }.padding()
                    
                    TLButton(title: "Log Out", background: .red) {
                        viewModel.logOutUser()
                    }.frame(height: 40)
                        .padding()
                    
                    Spacer()
                    
                }else{
                    Text("fail to load profile")
                }
                
                
                
            }.navigationTitle("Profile")
        })
    }
}

#Preview {
    ProfileView()
}
