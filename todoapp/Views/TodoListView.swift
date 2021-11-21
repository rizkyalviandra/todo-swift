//
//  TodoListView.swift
//  todoapp
//
//  Created by Rizky Alviandra on 21/11/21.
//

import SwiftUI

struct TodoListView: View {
    
    @ObservedObject var todoVM : TodoViewModel
    
    var body: some View {
        List{
            ForEach (todoVM.todos.filter {
                        self.todoVM.searched.isEmpty ? true : $0.task.localizedCapitalized.contains(self.todoVM.searched)} ){ todo in
                TodoView(todo: todo)
            }
            .onDelete(perform: {
                todoVM.removeTodo(indexAt: $0)
            })
        }.listStyle(InsetListStyle())
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(todoVM: TodoViewModel())
    }
}
