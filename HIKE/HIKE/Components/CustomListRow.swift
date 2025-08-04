//
//  CustomListRow.swift
//  HIKE
//
//  Created by Shehzad Ahmad on 04/08/2025.
//

import SwiftUI

struct CustomListRow: View {
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLable: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent{
            if rowContent != nil{
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            }else if (rowLinkLable != nil && rowLinkDestination != nil){
                Link(
                    rowLinkLable!,
                    destination: URL(string: rowLinkDestination!)!
                )
            } else{
                EmptyView()
            }
   
        }label: {
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    
                    Image(systemName:rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRow(
            rowLabel: "Designer",
            rowIcon: "paintpalette",
//            rowContent: "Jon Doe",
            rowTintColor: .pink
        )
    }
}
