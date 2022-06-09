//
//  Lists.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 30/05/22.
//

import SwiftUI

struct Lists: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var title: String
    var body: some View {
        
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
        }
        .listStyle(DefaultListStyle())
        //        .listStyle(Plain/Grouped/Sidebar/Default/InsetGroupedListStyle())
        .navigationTitle(title)
    }
}



struct Lists_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Lists(title: "")
        }
        .environmentObject(ListViewModel())
    }
}
