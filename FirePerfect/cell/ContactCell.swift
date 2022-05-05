//
//  PostCell.swift
//  FirePerfect
//
//  Created by Abduqaxxor on 5/5/22.
//

import SwiftUI

struct ContactCell: View {
    
    var contact: Contact
    
    var body: some View {
        VStack(alignment: .leading){
           HStack {
               Text(contact.firstname!.uppercased())
                .fontWeight(.bold)
                .foregroundColor(.red)
               Text(contact.lastname!.uppercased())
                   .fontWeight(.bold)
                   .foregroundColor(.red)
           }
            Text(contact.phone!).padding(.top,5)
                .foregroundColor(.black)
        }
        .padding()
    }
}

struct ContactCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactCell(contact: Contact(firstname: "firstname", lastname: "lastname", phone: "phone"))
    }
}
