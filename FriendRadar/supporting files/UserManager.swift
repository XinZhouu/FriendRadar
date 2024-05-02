//
//  UserManager.swift
//  FriendRadar
//
//  Created by Xin Zhou on 5/1/24.
//

import Foundation

@Observable
class UserManager: Identifiable {
    var loggedInUser: User?
    
    init() {
        self.loggedInUser = nil  // Start with no user logged in
    }
}
