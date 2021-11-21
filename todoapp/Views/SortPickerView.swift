//
//  SortPickerView.swift
//  todoapp
//
//  Created by Rizky Alviandra on 21/11/21.
//

import SwiftUI

struct SortPickerView: View {
    @ObservedObject var todoVM : TodoViewModel
    var body: some View {
        Picker("", selection: $todoVM.sortType) {
            ForEach(SortType.allCases){
                Text($0.rawValue.capitalized)
                    .tag($0)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

struct SortPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SortPickerView(todoVM: TodoViewModel())
    }
}
