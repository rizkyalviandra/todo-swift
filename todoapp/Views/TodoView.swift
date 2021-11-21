//
//  TodoView.swift
//  todoapp
//
//  Created by Rizky Alviandra on 21/11/21.
//

import SwiftUI

struct TodoView: View {
    
    var todo : Todo
    
    var body: some View {
        VStack (alignment: .leading){
            HStack{
                VStack(alignment: .leading) {
                    Text("Task:")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(todo.task)
                    .font(.system(size: 20, weight: .bold))
                }
                Spacer()
                VStack (alignment:.leading){
                    Text("Done:")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(String(todo.isDone))
                }
            }
        }
        .padding(10)
        .background(
            todo.priority.color.opacity(0.2))
            .cornerRadius(10)
            .background(
                RoundedRectangle(cornerRadius: 10 , style: .continuous)
                .stroke(todo.priority.color , lineWidth: 0.7)
                .shadow(color: todo.priority.color, radius: 0.7))
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView(todo: Todo(id: "", task: "Task Name", isDone: false, priority: .normal))
    }
}
