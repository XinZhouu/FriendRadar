//
//  MapManager.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/30/24.
//

import Foundation
import _MapKit_SwiftUI
import SwiftUI

@Observable 
class MapManager: Identifiable {
    // search specific locations
    var searchQuery: String
    var location: MapCameraPosition
    var selectedLocation: Location?

    
    init() {
        self.searchQuery = ""
        self.location = MapCameraPosition.region(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.8730, longitude: -122.2595),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
        self.selectedLocation = nil
    }
    
    
    
    func updateLocation() {
        let currLocation = UCBProperty.UCBProperties.first(where: { $0.name == "Soda Hall" })
        let newCenter = currLocation?.coordinate
        let newSpan = MKCoordinateSpan(latitudeDelta: 0.0005, longitudeDelta: 0.0005)
        location = MapCameraPosition.region(MKCoordinateRegion(center: newCenter!, span: newSpan))
    }
    
    
//    func geocode() {
//        let geocoder = CLGeocoder()
//        geocoder.geocodeAddressString(searchQuery) { (placemarks, error) in
//            guard let placemarks = placemarks, let location = placemarks.first?.location else {
//                print("No location found")
//                return
//            }
//            let newRegion = MKCoordinateRegion(
//                center: location.coordinate,
//                span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
//            )
//            region = newRegion
//
//            // Assume each search creates a new building point
//            let building = UCBProperty(name: searchQuery, coordinate: location.coordinate)
//            
//            buildings.append(building)
//        }
//    }
}
