//
//  User.swift
//  toDoList
//
//  Created by Amine Gannoun on 26/03/2024.
//

import Foundation


struct User : Codable {
    
    var id : String
    var name : String
    var email : String
    var joined : TimeInterval
    
}
