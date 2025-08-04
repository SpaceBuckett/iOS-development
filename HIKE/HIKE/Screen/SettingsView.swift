//
//  SettingsView.swift
//  HIKE
//
//  Created by Shehzad Ahmad on 03/08/2025.
//

import SwiftUI

struct SettingsView: View {
    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
    var body: some View {
        List{
            Section{
                HStack{
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10){
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's Choice")
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }.foregroundStyle(
                    LinearGradient(colors: [
                        .customGreenLight,
                        .customGreenMedium,
                        .customGreenDark
                    ], startPoint: .top,
                                   endPoint: .bottom)
                )
                VStack(spacing: 8){
                    Text("Where can you find \nperfect tracks")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike looks georgeous in photos but even beautiful in real. The hike that you hope to do again.\nFind the best day hikes.")
                        .font(.footnote)
                        .italic()
                    Text("Dust off boots! It's time for a walk")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                    
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
             
            } .listRowSeparator(.hidden)
            
            Section(
                header: Text("Alternate Icons")
            )
            {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button{
                                print("Icon was pressed")
                                UIApplication.shared.setAlternateIconName(
                                    alternateAppIcons[item]
                                ){
                                    error in
                                    if error != nil{
                                        print("Failed to request icon \(String(describing: error?.localizedDescription))")
                                    }else{
                                        print("Success! You have chanegd the app's icon")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }.buttonStyle(.borderless)
                        }
                    }
                }.padding(.top, 12)
                
                Text("Choose your favorite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote )
                    .padding(.bottom, 12)
                
            }.listRowSeparator(.hidden)
            
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    Text("Copyright - All right reserved.")
                    Spacer()
                }.padding(.vertical, 8)
            ){
                CustomListRow(rowLabel: "Application",
                              rowIcon: "apps.iphone",
                              rowContent: "Hike",
                              rowTintColor: .blue)
             
                CustomListRow(rowLabel: "Compatibility",
                              rowIcon: "info.circle",
                              rowContent: "iOS, iPadOS",
                              rowTintColor: .red)
                
                CustomListRow(rowLabel: "Version",
                              rowIcon: "gear",
                              rowContent: "1.0.0",
                              rowTintColor: .purple)
                
                CustomListRow(rowLabel: "Developer",
                              rowIcon: "ellipsis.curlybraces",
                              rowContent: "Shahzad",
                              rowTintColor: .mint)
                
                CustomListRow(rowLabel: "GitHub",
                              rowIcon: "globe",
                              rowContent: nil,
                              rowTintColor: .indigo,
                              rowLinkLable: "SpaceBuckett",
                              rowLinkDestination: "https://credo.academy"
                              
                
                )
            }
            
        }
       
      
        
      
    }
}

#Preview {
    SettingsView()
}
