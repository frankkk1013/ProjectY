//
//  ItemModel.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 09/06/22.
//

import Foundation

//Immutable struct because all the items are "let" and not "var", so they don't change
struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
