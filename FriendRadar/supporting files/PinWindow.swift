//
//  PinWindow.swift
//  FriendRadar
//
//  Created by Xin Zhou on 5/2/24.
//

import SwiftUI
import MapKit
import SwiftData

struct PinWindow: View {
    @Environment(UserManager.self) private var userManager
    @Environment(MapManager.self) private var mapManager
    @Query var userInfo: [User]
    @Query var locInfo: [Location]
    
    let coordinate: CLLocationCoordinate2D
    @Binding var showingPopup: Bool
    @State var input: String = ""

    var body: some View {
        VStack {
            
            Text("Define your pin!")
                .font(.caption)
                .padding(.top)
            
            HStack {
                Text("Location Name").font(.caption)
                TextField("Edit Name", text: $input)
                    .textFieldStyle(.roundedBorder)
                    .font(.caption2)
            }
            .padding()
            
            HStack {
                Text("Latitude: \(coordinate.latitude)")
                Spacer()
            }
            .padding(.horizontal)
            .font(.caption)
            HStack {
                Text("Longitude: \(coordinate.longitude)")
                Spacer()
            }
            .padding(.horizontal)
            .font(.caption)
            
            HStack {
                Button(action:{
                    // add to the fav loc list
                    let loggedInUserName = userManager.loggedInUser?.name
                    let user = userInfo.first(where: { $0.name == loggedInUserName})
                    user?.favProperties.insert(input, at:0)
                    
                    // add to the location pin
                    
                    
                    withAnimation {
                        showingPopup = false
                    }
                }) {
                    Text("Add Pin!")
                }
                Spacer()
                Button("Cancel!") {
                    withAnimation {
                        showingPopup = false
                    }
                }
            }
            .padding()
            .font(.caption)
        }
        .frame(width: 300, height: 200)
        .background(Color.white.opacity(0.85))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    PinWindow(coordinate: CLLocationCoordinate2D(latitude: 37.873357, longitude: -122.253168), showingPopup: .constant(true))
}
