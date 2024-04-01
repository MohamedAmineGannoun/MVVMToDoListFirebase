//
//  toDoListApp.swift
//  toDoList
//
//  Created by Amine Gannoun on 26/03/2024.
//

import SwiftUI
import FirebaseCore


@main
struct toDoListApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
