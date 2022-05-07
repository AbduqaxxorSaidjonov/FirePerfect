//
//  AddPostScreen.swift
//  FirePerfect
//
//  Created by Abduqaxxor on 4/5/22.
//

import SwiftUI

struct AddContactScreen: View {
    
    @ObservedObject var database = RealtimeStore()
    @ObservedObject var storage = StorageStore()
    @Environment(\.presentationMode) var presentation
    @State var firstname: String = ""
    @State var lastname: String = ""
    @State var phone: String = ""
    @State var isLoading = false
    
    @State var defImage = UIImage(imageLiteralResourceName: "ic_picker")
    @State var pickedImage: UIImage? = nil
    @State var showImagePicker: Bool = false
    
    
    func addNewContact(urlString: String){
        let contact = Contact(firstname: firstname, lastname: lastname, phone: phone,imgUrl: urlString)
        database.storeContact(contact: contact, completion: { success in
            isLoading = false
            if success{
                self.presentation.wrappedValue.dismiss()
            }
            
        })
    }
    
    func uploadImage(){
        isLoading = true
        storage.uploadImage(pickedImage!, completion: { downloadURL in
            let urlString = downloadURL!.absoluteString
            print(urlString)
            addNewContact(urlString: urlString)
        })
    }
    
    var body: some View {
        ZStack{
            VStack{
                Button(action: {
                    self.showImagePicker.toggle()
                }, label: {
                    Image(uiImage: pickedImage ?? defImage).resizable().frame(width: 100, height: 100).scaledToFit()
                })
                    .sheet(isPresented: $showImagePicker, onDismiss: {
                        self.showImagePicker = false
                    }, content: {
                        ImagePicker(image: self.$pickedImage, isShown: self.$showImagePicker)
                    })
                TextField("Firstname",text: $firstname)
                    .padding(.leading)
                    .frame(height: 50)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(8)
                TextField("Lastname",text: $lastname)
                    .padding(.leading)
                    .frame(maxHeight: 50)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(8)
                TextField("Phone",text: $phone)
                    .padding(.leading)
                    .frame(maxHeight: 50)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(8)
                Button(action: {
                    uploadImage()
                }, label: {
                    Text("Add").foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                })
                    .frame(height: 50)
                    .background(.red)
                    .cornerRadius(8)
                Spacer()
            }
            .padding(10)
            if isLoading{
                ProgressView()
            }
        }
        .navigationBarTitle("Add Contact",displayMode: .inline)
    }
}

struct AddContactScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddContactScreen()
    }
}
