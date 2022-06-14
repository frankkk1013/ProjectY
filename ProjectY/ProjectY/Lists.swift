//
//  Lists.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 30/05/22.
//

import SwiftUI

struct Lists: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var tripToShow = Trip(city: "", lists: [], tripDetails: TripDetails(pref: []), sustainableLeaf: "", url: "")
    @StateObject var trips: UseTrip
    @StateObject var lists: UseList = UseList()
    @State var trip : Trip
    @State var list : ToDoList = ToDoList(name: "", rows: [], completePercent: "")
    @State private var presentAlert = false
    @State private var rowTitle: String = ""
    
    
    
    
    
    
    var title: String
    var body: some View {
        
        List {
            
            
            ForEach(listViewModel.items) { item in
                
                ListRowView(showSheetView: false, list: $list, item: item)
                //                    .onTapGesture{
                //                        self.trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows = list.rows
                //                        print(list.rows)
                //
                //
                //
                //
                //                            self.listViewModel.updateItem(item: item)
                //                    }
                //
                
                
            }.onDelete(perform: delete)
            
            
            
            
        }.onChange(of: list.rows, perform: { _ in
            
            
            self.trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows = list.rows
            withAnimation{
                self.listViewModel.refresh(rows: self.list.rows)
                
            }
            
            
            
            
            
            
            
        })
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action:{
                    presentAlert.toggle()
                    
                    
                },label: {
                    Image(systemName: "plus")
                }).textFieldAlert(isPresented: $presentAlert, title: "Insert your new item", text: "", placeholder: "", action: {newText in
                    
                    if !(newText?.isEmpty ?? false || (newText == nil)){
                        //on cancel crash
                        self.list.rows.append(Row(category: "any", title: newText!, sustainable: "", description: "", season: "", checked: "false"))
                        //                self.trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows = list.rows
                        //                self.listViewModel.refresh(rows: list.rows)
                    }
                    
                })
                EditButton()
            }
        }
        
        //        .navigationBarItems(leading:
        //        )
        
        .listStyle(DefaultListStyle())
        
        .navigationTitle(title)
        
        .onAppear{
            self.list = trips.listOfTrips[trips.listOfTrips.firstIndex(where: { $0.city == trip.city })!].lists.first(where: {$0.name == title})!
            self.listViewModel.setItems(rows: list.rows)
        }
        .onDisappear{
            self.trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows = self.list.rows
            updatePersistence(trip: self.trip)
        }
    }
    
    private func updatePersistence(trip: Trip){
        
        //        self.trip.lists[trip.lists.firstIndex(where: {$0.name == list.name})!].rows = self.list.rows
        
        self.trips.handleUpdate(newValueTrip: trip)
        
    }
    
    func delete(at offsets: IndexSet){
        if let first = offsets.first{
            self.list.rows.remove(at: first)
            
            
            
            
            
            
            
            
            
        }
    }
}



//struct Lists_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            Lists(title: "")
//        }
//        .environmentObject(ListViewModel())
//    }
//}
