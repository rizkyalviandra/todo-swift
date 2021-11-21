//
//  ContentView.swift
//  todoapp
//
//  Created by Rizky Alviandra on 21/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todoVM = TodoViewModel()
        
    @State var searched = ""
    
    var body: some View {
        NavigationView{
            VStack{
                TodoSearchView(todoVM: todoVM)
                SortPickerView(todoVM : todoVM)
                TodoListView(todoVM : todoVM)
            }
            .modifier(MainViewModifier(todoVM : todoVM))
        }
    }
}

struct ContentView_Prevews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
