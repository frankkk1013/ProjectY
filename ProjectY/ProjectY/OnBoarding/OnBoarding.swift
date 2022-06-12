//
//  OnBoarding.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 03/03/22.
//

import SwiftUI



struct OnBoarding: View {
    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
    @Environment(\.presentationMode) var presentationMode
    
    let columns = [
            GridItem(.flexible())
        
        ]
    var body: some View {
        
        ZStack{
            Rectangle().foregroundColor(Color("onboarding")).edgesIgnoringSafeArea(.all)
            PlayerView()
                           
                            .blur(radius: 0)
                            .shadow(radius: 13)
//                            .scaledToFit()
                            
                            .frame(width: 350, height: 500, alignment: .center)
            VStack{
                Spacer()
                Button(action: {
                    UserDefaults.standard.set(true, forKey: "LaunchBefore")
                    withAnimation(){
                        needsAppOnboarding = false
                        presentationMode.wrappedValue.dismiss()
                       
                    }
                }){
                Text("Next")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 320, height: 60)
                    .background(Color(#colorLiteral(red: 0.4032904506, green: 0.7195885181, blue: 0.4985763431, alpha: 1)))
                    .cornerRadius(15)
                    .padding(.top, 50)
                    
                }.padding()
            }
            
            
        }
        
//        VStack {
//            Spacer()
//                Text("What's this")
//                    .fontWeight(.heavy)
//                    .font(.system(size: 50))
//                    .frame(width: 300, alignment: .leading)
//        
//                
//                VStack(alignment: .leading) {
//                
//                        NewDetail(image: "luggage", imageColor: Color("INNER PARTY"), title: "Powers", description: "Pack your suitcase in a sustainable way")
//                        NewDetail(image: "list", imageColor: Color.orange, title: "Journey", description: "Check the lists to not forget anything")
//                        NewDetail(image: "bucket", imageColor: Color("EXAWER"), title: "Sounds", description: "Delete the unsustainable items")
//                        NewDetail(image: "leaf", imageColor: Color("EXAWER"), title: "Sounds", description: "Earn leaves and see how sustainable you are")
//                        
//                    
//                    
//            }
//
//            Spacer()
//            
            
//        }
    }
}

struct NewDetail: View {
    var image: String
    var imageColor: Color
    var title: String
    var description: String

    var body: some View {
        HStack(alignment: .center) {
            HStack {
                Image( image)
                    .resizable()
                    .scaledToFit()
                    .font(.system(size: 50))
                    .frame(width: 50)
                    .foregroundColor(imageColor)
                    .padding()
                    

                VStack(alignment: .leading) {
                    Text(title).bold()
                
                    Text(description)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
            }.frame(width: 340, height: 100)
            
        }
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
        OnBoarding().previewDevice("iPhone 8")
    }
}
