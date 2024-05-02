//
//  ProfileView.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/18/24.
//

import SwiftUI


struct ProfileView: View {
    @State private var options = ["Cory Hall", "Davis Hall", "Evans Hall", "Sather Gate"]
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(systemName: "lock")
                    Text("Xin_Zhou")
                        .bold()
                    Spacer()
                    Image(systemName: "pencil")
                }
                .padding()
                .foregroundColor(.white)
                
                HStack {
                    VStack {
                        Button(action: {}) {
                            Image("Zhou")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                                .shadow(radius: 4)
                        }
                        
                        Text("Xin Zhou").font(.callout)
                        Text("@xinzzzz").font(.callout)
                    }
                    .foregroundColor(.white)
                    
                    
                    HStack(spacing: 40) {
                        VStack {
                            Text("31").bold()
                            Text("posts").font(.caption)
                        }
                        VStack {
                            Text("102").bold()
                            Text("followers").font(.caption)
                        }
                        VStack {
                            Text("290").bold()
                            Text("following").font(.caption)
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                }
                .padding()
                
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Major: Building Science")
                        Spacer()
                        Button(action: {}) {
                            Text("Edit profile")
                        }
                        .padding(.horizontal)
                        .background(.gray)
                        .cornerRadius(16)
                    }
                    .padding()
                }
                .foregroundColor(.white)
                .font(.footnote)
            }
            .background(Color.BerkeleyBlue)
            
            
            VStack {
                HStack {
                    Text("Locations").bold()
                    Spacer()
                }
                .padding()
                
                ForEach(options, id: \.self) { option in
                    StarLocationView(locationName: option)
                }
                .padding()
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    ProfileView()
}
