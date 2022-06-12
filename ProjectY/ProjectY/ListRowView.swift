//
//  ListRowView.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 09/06/22.
//

import SwiftUI

struct ListRowView: View {
    
    @State var showSheetView = false
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "circle.inset.filled" : "circle")
                .foregroundColor(Color(#colorLiteral(red: 0.4032904506, green: 0.7195885181, blue: 0.4985763431, alpha: 1)))
            
            Text(item.title)
            if item.sustainable == "true"{
                Image(systemName: "leaf")
                    .foregroundColor(Color(#colorLiteral(red: 0.4032904506, green: 0.7195885181, blue: 0.4985763431, alpha: 1)))
                
                Spacer()
            
                Button(action: {self.showSheetView.toggle()}, label: {
                    Label("", systemImage: "info.circle")
                        .foregroundColor(Color(#colorLiteral(red: 0.4032904506, green: 0.7195885181, blue: 0.4985763431, alpha: 1)))
                        .sheet(isPresented: $showSheetView) {
                            SheetView(title: item.title, description: item.description)
                            
                        }
                    
                })
                
            }
            
            
//            Button(action: {
//                self.showSheetView.toggle()
//            }) {
//                Image(systemName: "info.circle")
//                    .foregroundColor(Color(#colorLiteral(red: 0.4032904506, green: 0.7195885181, blue: 0.4985763431, alpha: 1)))
//                    .sheet(isPresented: $showSheetView) {
//                        SheetView()
//                    }
//            }
            
            
            
//                Image(systemName: "info.circle")
//                    .foregroundColor(Color(#colorLiteral(red: 0.4032904506, green: 0.7195885181, blue: 0.4985763431, alpha: 1)))
            
        }
        .font(.title2)
        .padding(.vertical, 12)
    }
}



//struct ListRowView_Previews: PreviewProvider {
//    
//    static var item1 = ItemModel(title: "First item", isCompleted: false)
//    static var item2 = ItemModel(title: "Second item", isCompleted: true)
//    
//    static var previews: some View {
//        Group {
//            ListRowView(item: item1)
//            ListRowView(item: item2)
//        }
//        .previewLayout(.sizeThatFits)
//    }
//}
