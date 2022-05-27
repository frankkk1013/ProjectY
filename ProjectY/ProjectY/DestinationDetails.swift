//
//  DestinationDetails.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 24/05/22.
//

import SwiftUI

struct DestinationDetails: View {
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: true) {
                
                VStack(alignment: .leading){
                    
                    Text("Destination Details")
                }
                //            .navigationBarTitle("Destination details")
            }
            //            .navigationBarItems(trailing:NavigationLink(destination: Text(""),label: {}))
        }
    }
}


struct DestinationDetails_Previews: PreviewProvider {
    static var previews: some View {
        DestinationDetails()
    }
}
