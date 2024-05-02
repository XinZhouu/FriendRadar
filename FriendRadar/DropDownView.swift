//
//  DropDownView.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/18/24.
//

import SwiftUI

struct DropDownView: View {
    @Environment(UserManager.self) private var userManager
    @Environment(MapManager.self) private var mapManager
    
    @Binding var isOpen: Bool
    let options: [String]
    var onSelect: (String) -> Void
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(options, id: \.self) { option in
                        StarLocationView(locationName: option)
                    }
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(20)
                    
                }
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: 170)
            .padding(.horizontal)
            .cornerRadius(5)
        }
    }
}

//#Preview {
//    DropDownView(isOpen: .constant(true), options: ["Soda Hall", "Barren Hall", "Alumni House", "Dwinelle Hall", "Evans Hall"], onSelect: "")
//        .environment(UserManager())
//}
