//
//  SignUpView.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/18/24.
//

import SwiftUI
import SwiftData

struct SignUpView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var userInfo: [User]
    @Environment(\.dismiss) private var dismiss
    
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String? = nil
    @Binding var isShowingSignUp: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 90)
                    
                }
                .padding()
                
                
                Text("Welcome!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 30)
                
                TextField("Full Name", text: $fullName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .padding(.bottom, 15)
                
                TextField("Email Address", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .padding(.bottom, 15)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .padding(.bottom, 15)
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button(action: {
                    addUser()
                    dismiss()
                }) {
                    Text("Sign Up")
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.BerkeleyBlue)
                        .cornerRadius(40)
                }
                .padding(.horizontal)
                
            }
            .padding()
        }
    }
    func addUser() {
        let newUser = User(name: fullName, email: email, password: confirmPassword, favProperties: [], friends: [])
        modelContext.insert(newUser)
    }
}

#Preview {
    SignUpView(isShowingSignUp: .constant(true))
}
