//
//  SignInScreen.swift
//  FirePerfect
//
//  Created by Abduqaxxor on 24/4/22.
//

import SwiftUI

struct SignInScreen: View {
    
    @EnvironmentObject var session: SessionStore
    @State var isLoading = false
    @State var email = ""
    @State var password = ""
    @State var showDetail = false
    
    func doSignIn(){
    isLoading = true
        SessionStore().signIn(email: email, password: password, handler: {(res,err) in
            isLoading = false
            if err != nil {
                print("Check email or password")
                return
            }
            session.listen()
            print("User signed in")
        })
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Text("Welcome Back").font(.system(size: 30))
                    .foregroundColor(.red)
                TextField("Email",text: $email)
                    .frame(height: 45).padding(.leading,10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(22.5)
                SecureField("Password",text: $password)
                    .frame(height: 45).padding(.leading , 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(22.5)
                Button(action: {
                    doSignIn()
                }, label: {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                })
                    .frame(height: 45)
                    .background(Color.red)
                    .cornerRadius(22.5)
                Spacer()
                HStack{
                Text("Don't have an account?")
                       Button(action: {
                           self.showDetail.toggle()
                        }, label:  {
                            Text("Sign Up").foregroundColor(.red)
                                .fontWeight(.bold)
                        })
                        .sheet(isPresented: $showDetail, content: {
                            SignUpScreen()
                        })
                }
            }
            .padding()
            if isLoading {
                ProgressView()
            }
        }
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
