//
//  GradientButton.swift
//  HIKE
//
//  Created by Shehzad Ahmad on 03/08/2025.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .padding(.vertical, 12)
        .padding(.horizontal, 30)
        .background(
            configuration.isPressed ?
            LinearGradient(
                colors: [
                    .customGrayMedium,
                    .customGrayLight
                ],
                startPoint: .top,
                endPoint: .bottom):
            LinearGradient(
                colors: [
                    .customGrayLight,
                    .customGrayMedium
                ],
                startPoint: .top,
                endPoint: .bottom)
        )
        .cornerRadius(30)
    }
}
