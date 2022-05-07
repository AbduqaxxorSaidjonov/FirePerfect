//
//  PostCell.swift
//  FirePerfect
//
//  Created by Abduqaxxor on 5/5/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContactCell: View {
    
    var contact: Contact
    
    var body: some View {
        HStack{
            if contact.imgUrl != nil {
                WebImage(url: URL(string: contact.imgUrl!))
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            else{
                Image("ic_picker").resizable().frame(width: 100, height: 100)
            }
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
}

struct ContactCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactCell(contact: Contact(firstname: "firstname", lastname: "lastname", phone: "phone"))
    }
}
