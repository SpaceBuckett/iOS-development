//
//  ContentView.swift
//  Wishlist
//
//  Created by Shehzad Ahmad on 07/08/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
     
    var body: some View {
        NavigationStack{
            List{
                ForEach(wishes){ wish in
                    Text(wish.title)
                        .font(.title2.weight(.regular))
                        .padding(.vertical, 2)
                        .swipeActions{
                            Button("Delete", role: .destructive){
                                modelContext.delete(wish)
                            }
                        }
                }
            }.navigationTitle("Wishlist")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button{
                            isAlertShowing.toggle()
                        }label: {
                            Image(systemName: "plus")
                                .imageScale(.large)
                        }
                    }
                }.alert("Create a new wish", isPresented: $isAlertShowing){
                    TextField("Enter a wish", text: $title)
                    
                    Button{
                        modelContext.insert(Wish(title:  title))
                        title = ""
                    } label: {
                        Text("Save")
                    }
                }
                .overlay{
                    if wishes.isEmpty{
                        ContentUnavailableView("My Wishlist", systemImage:"heart.circle",
                            description: Text("No wishes yet. Add one to get started.")
                        )
                    }
                }
        }
    }
}

#Preview("Sample Data List"){
    let container = try! ModelContainer(for: Wish.self,
                                        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    
    container.mainContext.insert(Wish(title: "Master SwiftUI"))
    container.mainContext.insert(Wish(title: "Master Golang"))
    container.mainContext.insert(Wish(title: "Build a House"))
    container.mainContext.insert(Wish(title: "Buy a Car"))
  
    return ContentView()
        .modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
