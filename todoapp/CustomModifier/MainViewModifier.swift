//
//  MainViewModifier.swift
//  todoapp
//
//  Created by Rizky Alviandra on 21/11/21.
//

import Foundation
import SwiftUI

struct MainViewModifier: ViewModifier {
    @ObservedObject var todoVM : TodoViewModel
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("Todo List")
            .navigationBarItems(trailing: HStack(spacing:30){
                EditButton()
                    .disabled(todoVM.todos.isEmpty)
                Button(
                    action : { todoVM.isPresented.toggle()},
                    label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    })
            })
            .onChange(of: todoVM.sortType, perform: { _ in
                guard !todoVM.todos.isEmpty else { return }
                withAnimation() {todoVM.sort()}
            })
            .fullScreenCover(isPresented: $todoVM.isPresented, content: {
                AddTodoView(todoVM: todoVM)
            })
        
    }
}
