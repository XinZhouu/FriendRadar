//
//  locationAnimationView.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/29/24.
//
import SwiftUI

struct LocationAnimationView: View {
    @State private var animate = false

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue.opacity(0.3))
                .frame(width: animate ? 100 : 20, height: animate ? 100 : 20)
                .scaleEffect(animate ? 1.5 : 1)
                .animation(.easeOut(duration: 2).repeatForever(autoreverses: false), value: animate)
                .onAppear {
                    self.animate = true
                }

            Image(systemName: "location.fill")
                .foregroundColor(.blue)
                .font(.caption)
        }
    }
}

#Preview {
    LocationAnimationView()
}
