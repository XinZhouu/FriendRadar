//
//  ContentView.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/18/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var userManager = UserManager()
    @State private var mapManager = MapManager()
    @Environment(\.modelContext) private var modelContext
    
    @Query private var userInfo: [User]
    @Query private var locInfo: [Location]
    
    @State private var selectedTab = "Map"
    @State private var isSignedIn = false

    
    var body: some View {
        if (isSignedIn) {
            // this TabView should be the root view
            TabView(selection: $selectedTab) {
                Group {
                    // First tab
                    HomeView()
                        .tabItem {
                            Image(systemName: "map.circle")
                            Text("Map")
                        }
                        .tag("Map")
                        .environment(userManager)
                        .environment(mapManager)
                    
                    
                    // Second tab
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person.crop.circle")
                            Text("Profile")
                        }
                        .tag("profile")
                    
                    
                    // Third tab
                    FriendsView()
                        .tabItem {
                            Image(systemName: "person.2.circle.fill")
                            Text("Friends")
                        }
                        .tag("Friends")
                }
                .toolbarBackground(Color.white, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            }
            //        .accentColor(.yellow)
        } else {
             //for debugging
//            List{
//                ForEach (userInfo) {user in Text(user.name)}
//            }
            //Text("\(locInfo.count)")
            SignInView(isSignedIn: $isSignedIn)
                .environment(userManager)
                .environment(mapManager)
        }
    }
}

#Preview {
    ContentView()
}
