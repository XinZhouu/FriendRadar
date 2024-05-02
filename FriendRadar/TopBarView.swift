//
//  TopBarView.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/18/24.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        HStack {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 40)
        }
    }
}

#Preview {
    TopBarView()
}
