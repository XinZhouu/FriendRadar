//
//  MapView.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/30/24.
//

import SwiftUI
import MapKit
import SwiftData

struct MapView: View {
    // Data Flow and Persistence
    @Environment(MapManager.self) private var mapManager
    @Query private var locInfo: [Location]
    
    @State private var locationManager = LocationManager()
    @State private var selectedBuilding: UCBProperty?
    @Binding var showFriendContent: Bool
    
    // handle pin features
    @State private var tappedCoordinate: CLLocationCoordinate2D?
    @Binding var pinWindowShowUp: Bool
    
    var body: some View {
        //The initial postion must be passed
        //as a binding
        ZStack {
            MapReader { proxy in
                Map (position: Binding<MapCameraPosition>(
                    get: { self.mapManager.location },
                    set: { self.mapManager.location = $0 }),
                     interactionModes: .all) {
                    // mark the current user location
                    Marker("", systemImage: "mappin", coordinate: mapManager.location.region?.center ?? CLLocationCoordinate2D(latitude: 37.8730, longitude: -122.2595))
                        .tint(.orange)
                        .tag(1)
                    
                    ForEach(locInfo) { property in
                        if let coordinate = UCBProperty.UCBProperties.first(where: { $0.name == property.name })?.coordinate{
                            Annotation(property.name, coordinate: coordinate) {
                                // customized annotation style
                                AnnotationView(showFriendContent: $showFriendContent, targetLoc: property)
                            }
                            // hide annotations on the map
                            .annotationTitles(.hidden)
                            .tag(2)
                        }
                    }
                    
                    //            UserAnnotation()
                }
                     .mapStyle(.hybrid(elevation: .realistic))
                     .mapStyle(.imagery)
                     .mapControls {
                         //            MapUserLocationButton()
                         MapCompass()
                         MapScaleView()
                         MapPitchToggle()
                     }
                //debugging
                     .onMapCameraChange { context in
                         print(context.region)
                     }
                     .animation(.easeInOut, value: mapManager.location)
                     .safeAreaInset(edge: .bottom) {
                         HStack {
                             Spacer()
                             Button(action:{}) {
                                 Image(systemName: "plus")
                             }
                             Spacer()
                         }
                         .background(.thinMaterial)
                     }
                     .onTapGesture { position in
                         if let coordinate = proxy.convert(position, from: .local) {
                                 tappedCoordinate = coordinate
                                 withAnimation {
                                     pinWindowShowUp.toggle()
                                 }
                             }
                         }
            }
            
            if (pinWindowShowUp) {
                PinWindow(coordinate: tappedCoordinate ?? CLLocationCoordinate2D(latitude: 37.8730, longitude: -122.2595), showingPopup: $pinWindowShowUp)
                    .transition(.opacity)
            }
        }
    }
}





#Preview {
    MapView(showFriendContent: .constant(true), pinWindowShowUp: .constant(false))        .environment(MapManager())
}
