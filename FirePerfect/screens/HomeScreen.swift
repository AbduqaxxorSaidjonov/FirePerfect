//
//  HomeScreen.swift
//  FirePerfect
//
//  Created by Abduqaxxor on 24/4/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var session: SessionStore
    
    func doSignOut(){
        if SessionStore().signOut(){
            session.listen()
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                if let email = session.session?.email{
                Text("Welcome " + email)
                    .foregroundColor(.red)
                }
            }
            .navigationBarItems(trailing: HStack{
                Button(action: {
                    
                }, label: {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.red)
                })
                Button(action: {
                    doSignOut()
                }, label: {
                    Image(systemName: "arrow.right.square")
                        .foregroundColor(.red)
                })
            })
            .navigationBarTitle("Posts",displayMode: .inline)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
