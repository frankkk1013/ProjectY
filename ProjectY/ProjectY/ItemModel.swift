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
    var isCompleted: Bool
    var sustainable: String
    var description: String
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, sustainable: String, description: String) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.sustainable = sustainable
        self.description = description
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted, sustainable: sustainable, description: description)
    }
}
