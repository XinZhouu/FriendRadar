//
//  FriendBarView.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/18/24.
//

import SwiftUI

struct FriendBarView: View {
    @Environment(MapManager.self) private var mapManager
    let friends: [Friend]
    var showContent: Bool
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    if (mapManager.selectedLocation?.type == "hall") {
                        Image(systemName: "building.columns")
                    }
                    else if (mapManager.selectedLocation?.type == "gym") {
                        Image(systemName: "dumbbell")
                    }
                    else if (mapManager.selectedLocation?.type == "housing") {
                        Image(systemName: "house")
                    }
                    else if (mapManager.selectedLocation?.type == "library") {
                        Image(systemName: "book")
                    }
                    
                    Text(mapManager.selectedLocation?.name ?? "No Name").bold()
                    Spacer()
                    
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "plus.app")
                            Text("Add Locations")
                        }
                        .padding()
                        .foregroundColor(.white)
                    }
                }
                .padding(.leading)
                .foregroundColor(.white)
                
                HStack {
                    Spacer()
                    Text("12 of your friends add it to favorites")
                        .font(.caption)
                    Spacer()
                }
                .foregroundColor(.white)
            }
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 10) {
                    if showContent {
                        ForEach(friends) { friend in
                            Button(action: {}) {
                                Image(friend.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                                    .shadow(radius: 4)
                            }
                        }
                    }
                }
                .padding()
            }
            .background(Color.clear)
        }
    }
}

// Data model for a friend
struct Friend: Identifiable {
    let id: Int
    let name: String
    let imageName: String
}

// Sample data
// This should go to the supporting files
let friends = [
    Friend(id: 1, name: "Andrew", imageName: "Alise"),
    Friend(id: 2, name: "Alise", imageName: "Wang"),
    Friend(id: 3, name: "Xin", imageName: "Zhou"),
    Friend(id: 4, name: "David", imageName: "Peifer"),
    Friend(id: 5, name: "David", imageName: "Aao"),
]

#Preview {
    FriendBarView(friends: friends, showContent: true)
}
