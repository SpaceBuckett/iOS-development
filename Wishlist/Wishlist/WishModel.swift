//
//  WishModel.swift
//  Wishlist
//
//  Created by Shehzad Ahmad on 07/08/2025.
//

import Foundation
import SwiftData

@Model
class Wish{
    var title: String
    
    init(title: String){
        self.title = title
    }
}
