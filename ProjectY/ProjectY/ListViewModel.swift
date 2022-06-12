//
//  ListViewModel.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 09/06/22.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        
        
        
    }
    
    func setItems(rows: [Row]) {
        rows.forEach{ row in
            items.append(ItemModel(title: row.title, isCompleted: row.checked == "true" ? true : false, sustainable: row.sustainable, description: row.description))
            
        }
    }
    
    func updateItem(item: ItemModel) {
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        } {
//            //run this code
//        }
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func refresh(rows: [Row]) {
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        } {
//            //run this code
//        }
        self.items = []
        setItems(rows: rows)
    }
    
}
