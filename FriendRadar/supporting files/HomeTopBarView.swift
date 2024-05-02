//
//  HomeTopBarView.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/30/24.
//

import SwiftUI

struct HomeTopBarView: View {
    @Environment(MapManager.self) private var mapManager
    @Environment(UserManager.self) private var userManager
    
    @Binding var isSearchBarVisible: Bool
    @Binding var showDropdown: Bool
    
    @Binding var showFriendContent: Bool
    
    @State private var selectedOption: String?
    
    var body: some View {
        
        VStack(alignment: .center) {
            // The Search bar
            HStack {
                Text("Hi there \(userManager.loggedInUser?.name ?? "No user")!")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Image("LogoWhite")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 30)
            }
            .padding(.bottom)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(.leading, 0.5)
                    .foregroundColor(.white)
                
                TextField("Search for a location to pin...", text: Binding<String>(
                    get: { self.mapManager.searchQuery },
                    set: { self.mapManager.searchQuery = $0 }
                ), onCommit: {
                    isSearchBarVisible = false
                })
                
                Button(action:{}) {
                    Image(systemName: "mappin.and.ellipse.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(.leading, 0.5)
                        .foregroundColor(.white)
                }
                .padding(.trailing, 1)
            }
            
            Button(action: {
                withAnimation {
                    self.showDropdown.toggle()
                }
            }) {
                HStack {
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("Your star locations")
                    Image(systemName: showDropdown ? "chevron.up" : "chevron.down")
                    Spacer()
                    Button(action: {
                        mapManager.updateLocation()
                    }){
                        Image(systemName: "location")
                    }
                }
                .padding(.top)
            }
            .foregroundColor(.white)
            .cornerRadius(5)
            .padding(.horizontal)
            
            if showDropdown {
                DropDownView(isOpen: $showDropdown, options: userManager.loggedInUser?.favProperties ?? [""]) { option in
                    selectedOption = option
                    withAnimation {
                        self.showDropdown = false
                    }
                }
            }
            
            // Friend view
            if (showFriendContent) {
                FriendBarView(friends: friends, showContent: $showFriendContent)
            }
        }
        .padding()
        .background(Color.BerkeleyBlue.opacity(0.85))
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

#Preview {
    HomeTopBarView(isSearchBarVisible: .constant(true), showDropdown: .constant(false), showFriendContent: .constant(false))
        .environment(MapManager())
        .environment(UserManager())
}
