//
//  ToDoListItemView.swift
//  toDoList
//
//  Created by Amine Gannoun on 26/03/2024.
//

import SwiftUI

struct ToDoListItemView: View {
    
    let viewModel = ToDoListItemViewViewModel()
    let item : ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Button(action: {
                viewModel.toggleDone(item: item)
            }, label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            })
        }
    }
}

#Preview {
    ToDoListItemView(item: ToDoListItem(id: "", title: "Title", dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: false
    ))
}
