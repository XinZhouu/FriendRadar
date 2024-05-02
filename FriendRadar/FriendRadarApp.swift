//
//  FriendRadarApp.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/18/24.
//

import SwiftUI
import SwiftData


@main
struct FriendRadarApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(MapManager())
                .environment(UserManager())
        }
        .modelContainer(for: [User.self, Location.self])
    }
}
