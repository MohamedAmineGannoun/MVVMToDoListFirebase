//
//  ContentView.swift
//  toDoList
//
//  Created by Amine Gannoun on 26/03/2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        NavigationView {
            
            if viewModel.isSignedIn , !viewModel.currentUserId.isEmpty {
                accountView
            }else{
                LoginView()
            }
        }
    }
    
    @ViewBuilder
    var accountView : some View {
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem { Label(
                    title: { Text("Home") },
                    icon: { Image(systemName: "house") }
                ) }
            ProfileView()
                .tabItem { Label(
                    title: { Text("Profile") },
                    icon: { Image(systemName: "person.circle") }
                ) }
        }
    }
    
}

#Preview {
    MainView()
}
