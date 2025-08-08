//
//  WishlistApp.swift
//  Wishlist
//
//  Created by Shehzad Ahmad on 07/08/2025.
//

import SwiftUI
import SwiftData

@main
struct WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}
