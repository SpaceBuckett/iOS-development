//
//  CardView.swift
//  HIKE
//
//  Created by Shehzad Ahmad on 03/08/2025.
//

import SwiftUI

struct CardView: View {
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    func updateImage(){
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while(randomNumber == imageNumber)
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        
        ZStack {
            CustomBackgroundView()
          
            VStack {
                VStack(alignment: .leading){
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [
                                    .customGrayLight,
                                    .customGrayMedium,
                                ],
                                               startPoint: .top,
                                               endPoint: .bottom)
                            )
                        
                        Spacer()
                        Button{
                            isShowingSheet.toggle()
                        }label: {
                            CustomButtonView()
                        }.sheet(isPresented: $isShowingSheet){
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and family")
                        .multilineTextAlignment(.leading)
                }.padding()
                
                ZStack{
                    Circle()
                        .fill(
                            LinearGradient(colors: [
                                Color("ColorIndigoMedium"),
                                Color(   "ColorSalmonLight")
                                
                            ], startPoint: .topLeading, endPoint: .bottomTrailing)
                        ) 
                        .frame(width: 256, height: 256)
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                }
                
                Button{
                    updateImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium,
                                ],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        .shadow(
                            color: .black.opacity(0.25), radius: 0.25,
                            x: 1,
                            y: 2
                           )
                }
                .buttonStyle(GradientButton())
              
                
            }
        }.frame(width: 320, height: 570)
     
    }
}

#Preview {
    CardView()
}
