//
//  AnnotationView.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/30/24.
//

import SwiftUI
import SwiftData

struct AnnotationView: View {
    @Environment(MapManager.self) private var mapManager
    @Binding var showFriendContent: Bool
    var targetLoc: Location
    
    var body: some View {
        Button(action: {
            showFriendContent = true
            mapManager.selectedLocation = targetLoc
        }) {
            Text("\(targetLoc.likes.count)")
                .foregroundColor(.black)
                .frame(width: 30, height: 30)
                .background(Circle().fill(Color.yellow))
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
        }
    }
}

//#Preview {
//    AnnotationView(showFriendContent: .constant(true), targetLoc: Location(name: "Bowles Hall",likes: [
//        User(name: "Jitae Kim", email: "Jitae@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Barren Hall", "Alumni House", "Dwinelle Hall", "Evans Hall"], friends: []),
//        User(name: "Andrew Lee", email: "Namwook0921@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Stanley Hall", "Haas Pavilion", "Dwinelle Hall", "Evans Hall"], friends: [])], type: "hall"))
//}
