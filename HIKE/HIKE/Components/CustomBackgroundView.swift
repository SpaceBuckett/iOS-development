//
//  CustomBackgroundView.swift
//  HIKE
//
//  Created by Shehzad Ahmad on 03/08/2025.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y:3)
                .opacity(0.85)
            
            LinearGradient(colors: [
                Color.customGreenLight,
                Color.customGreenMedium
                
            ],
                           startPoint: .top,
                           endPoint: .bottom
            ).cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView().padding()
}
