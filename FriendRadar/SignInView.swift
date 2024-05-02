//
//  SignInView.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/18/24.
//

import SwiftUI
import SwiftData

struct SignInView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(UserManager.self) private var userManager
    @Environment(MapManager.self) private var mapManager
    
    @Query private var userInfo: [User]
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowingSignUp = false
    @Binding var isSignedIn: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 120)
                
                // Header
                Text("FriendRadar")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.BerkeleyBlue)
                    .cornerRadius(10)
                    .padding(.bottom, 40)
                
            }
            
            // Slogans
            Text("Where is my friends at?")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Find your X-pal!")
                .font(.title3)
                .padding(.bottom, 40)
            
            // Icons
            HStack {
                Image(systemName: "building.columns")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "fork.knife")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "dumbbell")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(height: 50)
            .padding(.bottom, 30)
            
            // Email
            TextField("email address", text: $email)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            // Password
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .padding(.bottom, 15)
            
            
            // Sign In and Sign Up buttons
            HStack {
                Button(action: {
                    checkUser()
                }) {
                    Text("Sign In")
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(40)
                }
                
                Button(action: {
                    self.isShowingSignUp = true
                }) {
                    Text("Sign Up")
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.BerkeleyBlue)
                        .cornerRadius(40)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .sheet(isPresented: $isShowingSignUp) {
            SignUpView(isShowingSignUp: $isShowingSignUp)
        }
        .onAppear {
            do {
                try modelContext.delete(model: User.self)
                try modelContext.delete(model: Location.self)
            } catch {
                print("Failed to clear data.")
            }
            
            for user in User.users {
                modelContext.insert(user)
                }
            
            for loc in Location.locations {
                modelContext.insert(loc)
            }
            }
        }
    
    func checkUser() {
        for user in userInfo {
            if user.email == email && user.password == password {
                isSignedIn.toggle()
                userManager.loggedInUser = user
                break
            }
        }
    }
}

//#Preview {
//    SignInView(isSignedIn: .constant(true))
//        .environment(UserManager())
//}
