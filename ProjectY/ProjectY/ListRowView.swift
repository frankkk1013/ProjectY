//
//  ListRowView.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 09/06/22.
//

import SwiftUI

struct ListRowView: View {
    
    @State var showSheetView = false
    @Binding var list : ToDoList
   
    
    var item: ItemModel
    
    var body: some View {
        HStack {
            HStack{
                Image(systemName: item.isCompleted ? "circle.inset.filled" : "circle")
                    .foregroundColor(Color(#colorLiteral(red: 0.4032904506, green: 0.7195885181, blue: 0.4985763431, alpha: 1)))
                    
                
                Text(item.title)
                if item.sustainable == "true" {
                    Image(systemName: "leaf")
                        .foregroundColor(Color(#colorLiteral(red: 0.4032904506, green: 0.7195885181, blue: 0.4985763431, alpha: 1)))
                    
                    
                    
                }else{
                    if item.description != ""{
                        Image(systemName: "leaf")
                            .foregroundColor(.orange).brightness(-0.3)
                        
                    }
                    
                    
                    
                   
                }
                
            }.onTapGesture {
                withAnimation{
                    if item.isCompleted{
                        self.list.rows[list.rows.firstIndex(where: {$0.title == item.title})!].checked
                         = "false"


                    }else{
                        self.list.rows[list.rows.firstIndex(where: {$0.title == item.title})!].checked
                         = "true"

                    }
                    
                        
                }
                    

                    
                    
            
                                                                                                                        
            }
            
            Spacer()
            
            if item.description != ""{
                Button(action: {self.showSheetView.toggle()}, label: {
                    Label("", systemImage: "info.circle")
                        .foregroundColor(item.sustainable == "true" ? Color(#colorLiteral(red: 0.4032904506, green: 0.7195885181, blue: 0.4985763431, alpha: 1)) : .orange)
                        .sheet(isPresented: $showSheetView) {
                            SheetView(title: item.title, description: item.description)
                            
                        }
                    
                }).padding()
                
            
                
                
            }
        
            
            
            

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
