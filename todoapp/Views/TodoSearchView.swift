//
//  TodoSearchView.swift
//  todoapp
//
//  Created by Rizky Alviandra on 21/11/21.
//

import SwiftUI

struct TodoSearchView: View {
    
    @ObservedObject var todoVM : TodoViewModel
    @State var isSearching = false
    
    var body: some View {
        HStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(#colorLiteral(red: 0.3156549894, green: 0.3207270241, blue: 0.327221803, alpha: 1)))
                            .cornerRadius(9)
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            TextField("Search ...", text: $todoVM.searched , onEditingChanged: { (isBegin) in
                                if isBegin {
                                    isSearching = true
                                } else {
                                    isSearching = false
                                }
                            }).keyboardType(.webSearch)
                            .foregroundColor(.black)
                            
                            if todoVM.searched != "" {
                                Button(action: {
                                    todoVM.searched = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(Color(#colorLiteral(red: 0.5446127653, green: 0.5465545654, blue: 0.5666400194, alpha: 1)))
                                }
                                
                            }
                            
                            
                        }
                        .padding(.trailing , 8)
                        .padding(.leading , 12)
                        
                    }.frame(width: 310, height: 38)
                    .padding(.leading, 7)
                    .padding(.top , 5)
                    .animation(.easeInOut(duration: 0.3))
                    
                    if isSearching {
                        Button(action: {
                            hideKeyboard()
                        }) {
                            Text("Cancel")
                        }
                    }
                    
                }
    }
}

struct TodoSearchView_Previews: PreviewProvider {
    static var previews: some View {
        TodoSearchView(todoVM: TodoViewModel())
    }
}
