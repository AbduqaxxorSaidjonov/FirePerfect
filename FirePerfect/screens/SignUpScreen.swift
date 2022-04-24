//
//  SignUpScreen.swift
//  FirePerfect
//
//  Created by Abduqaxxor on 24/4/22.
//

import SwiftUI

struct SignUpScreen: View {
    
    @Environment(\.presentationMode) var presentation
    @State var isLoading = false
    @State var fullname = ""
    @State var email = ""
    @State var password = ""
    
    func doSignUp(){
    isLoading = true
        SessionStore().signUp(email: email, password: password, handler: { (res,err) in
            isLoading = false
            if err != nil{
                print("User not created")
                return
            }
            print("User created")
            self.presentation.wrappedValue.dismiss()
        })
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Text("Create your account").font(.system(size: 30))
                    .foregroundColor(.red)
                TextField("Fullname",text: $fullname)
                    .frame(height: 45).padding(.leading,10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(22.5)
                TextField("Email",text: $email)
                    .frame(height: 45).padding(.leading,10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(22.5)
                SecureField("Password",text: $password)
                    .frame(height: 45).padding(.leading,10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(22.5)
                Button(action: {
                    doSignUp()
                }, label: {
                    Text("Sign Up").foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                })
                    .frame(height: 45)
                    .background(Color.red)
                    .cornerRadius(22.5)
                Spacer()
                HStack{
                    Text("Already have an account?")
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }, label: {
                       Text("Sign In")
                            .fontWeight(.bold)
                    })
                    .foregroundColor(.red)
                }
            }
            .padding()
            if isLoading{
                ProgressView()
            }
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
