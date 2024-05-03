//
//  MapView.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/18/24.
//

import SwiftUI
import MapKit
import CoreLocation
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(UserManager.self) private var userManager
    @Environment(MapManager.self) private var mapManager
    
    @State private var isSearchBarVisible = true
    
    //real-time location
    @ObservedObject var locationManager = LocationManager()
    
    @State private var buildings = [UCBProperty]()
    @State private var selectedBuilding: UCBProperty?
    @State private var showFriendContent = false
    
    @State private var showDropdown = false
    @State private var selectedOption: String?
    @State private var pinWindowShowUp = false

    var body: some View {
        VStack {
            // Top Bar
            HomeTopBarView(isSearchBarVisible: $isSearchBarVisible, showDropdown: $showDropdown, showFriendContent: $showFriendContent)
            
            // Map
            MapView(showFriendContent: $showFriendContent, pinWindowShowUp: $pinWindowShowUp)
                .environment(mapManager)
            }
        }
    }

#Preview {
    HomeView()
        .environment(UserManager())
}
