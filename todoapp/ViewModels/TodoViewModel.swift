//
//  TodoViewModel.swift
//  todoapp
//
//  Created by Rizky Alviandra on 21/11/21.
//

import Foundation

class TodoViewModel : Identifiable , ObservableObject {
    @Published var todos: [Todo] =  [
        Todo(task: "Ngoding Swift", isDone: false, priority: .high),
        Todo(task: "Ngoding React", isDone: true, priority: .normal),
        Todo(task: "Ngoding NextJS", isDone: false, priority: .medium),
        Todo(task: "Ngoding React Native", isDone: true, priority: .high),
    ]
    
    @Published var sortType : SortType = .alphabetical
    @Published var isPresented = false
    @Published var searched = ""
    
    func addTodo(todo: Todo) {
        todos.append(todo)
    }
    
    func removeTodo(indexAt: IndexSet) {
        todos.remove(atOffsets: indexAt)
    }
    
    func sort() {
        switch sortType {
            case .alphabetical :
                todos.sort(by: { $0.task < $1.task })
            case .priority :
                todos.sort(by: { $0.priority.rawValue > $1.priority.rawValue })
        }
    }
}
