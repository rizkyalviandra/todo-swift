//
//  Todo.swift
//  todoapp
//
//  Created by Rizky Alviandra on 21/11/21.
//

import Foundation
import SwiftUI

struct Todo: Identifiable , Equatable {
    var id: String = UUID().uuidString
    let task:String
    let isDone:Bool
    let priority: Priority
}

enum Priority: Int , Identifiable , CaseIterable {
    var id : Int {rawValue}
    
    case normal
    case medium
    case high
    
    var title: String {
        switch self {
            case .normal :
                return "Normal"
            case .medium :
                return "Medium"
            case .high :
                return "High"
        }
    }
    
    var color : Color {
        switch self {
            case .normal:
                return .yellow
            case .medium:
                return .orange
            case .high :
                return .red
        }
    }
}

enum SortType : String, Identifiable , CaseIterable {
    var id : String { rawValue }
        
    case alphabetical
    case priority
}
