//
//  PinWindow.swift
//  FriendRadar
//
//  Created by Xin Zhou on 5/2/24.
//

import SwiftUI
import MapKit

struct PinWindow: View {
    let coordinate: CLLocationCoordinate2D
    @Binding var showingPopup: Bool

    var body: some View {
        VStack {
            Text("Latitude: \(coordinate.latitude)")
            Text("Longitude: \(coordinate.longitude)")
            Button("Close") {
                withAnimation {
                    showingPopup = false
                }
            }
        }
        .frame(width: 200, height: 100)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    PinWindow(coordinate: CLLocationCoordinate2D(latitude: 37.873357, longitude: -122.253168), showingPopup: .constant(true))
}
