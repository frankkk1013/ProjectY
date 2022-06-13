//
//  SheetView.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 10/06/22.
//

import SwiftUI

struct SheetView: View {
    
    let title: String
    let description: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                    YourTrips.modalDismissedCount += 1
                    //YourTrips.fetchImage()
                }, label: {
                    Image(systemName: "xmark.circle").foregroundColor(.black)
                        .font(.title2)
                })
            }.padding(.trailing)
            Text(title).font(.title).bold().foregroundColor(.black)
                .padding(.bottom)
            Text(description).font(.body)
                .foregroundColor(.black)
        }.padding()
        Spacer()
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(title: "", description: "he")
    }
}
