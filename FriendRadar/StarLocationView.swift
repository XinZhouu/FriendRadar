//
//  StarLocationView.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/18/24.
//

import SwiftUI

struct StarLocationView: View {
    var locationName: String
    
    var body: some View {
        HStack {
            Image(systemName:"star.fill")
                .foregroundColor(.yellow)
            Text(locationName)
            Spacer()
            Button(action:{}) {
                Image(systemName: "minus.square.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(5)
    }
}

#Preview {
    StarLocationView(locationName: "Cory Hall")
}
