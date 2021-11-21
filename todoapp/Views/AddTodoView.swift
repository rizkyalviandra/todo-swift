//
//  AddTodoView.swift
//  todoapp
//
//  Created by Rizky Alviandra on 21/11/21.
//

import SwiftUI

struct AddTodoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var todoVM : TodoViewModel
    
    @State var task = ""
    @State var isDone = false
    @State var priority : Priority = .normal
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Task")) {
                    TextField("Todo ", text : $task)
                }
                Section {
                    Picker("Priority", selection: $priority) {
                        ForEach(Priority.allCases) { priority in
                            Label(
                                title: { Text(priority.title) },
                                icon: { Image(systemName: "exclamationmark.circle") })
                                .foregroundColor(priority.color)
                                .tag(priority)
                        }
                    }
                }
            }
            .navigationBarTitle("Add", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action:{
                                presentationMode.wrappedValue.dismiss() },
                                label : {
                                    Text("Cancel")
                                    .foregroundColor(.red)
                                }),
                trailing: Button(action: {todoVM.addTodo(todo: .init(task: task, isDone: isDone, priority: priority))
                    presentationMode.wrappedValue.dismiss()}, label: {Text("Save")}).disabled(task.isEmpty)
                        )
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(todoVM: TodoViewModel())
    }
}
