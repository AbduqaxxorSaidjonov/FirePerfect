
import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var session: SessionStore
    @ObservedObject var database = RealtimeStore()
    @State var isLoading = false
    
    func doSignOut(){
        isLoading = true
        if SessionStore().signOut(){
            isLoading = false
            session.listen()
        }
    }
    
    func apiContacts(){
        isLoading = true
        database.loadContacts{
           isLoading = false
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(database.items , id: \.self){item in
                        ContactCell(contact: item)
                        
                    }
                }.listStyle(PlainListStyle())
                if isLoading{
                    ProgressView()
                }
            }
            .navigationBarItems(trailing: HStack{
                NavigationLink(destination:
                                AddContactScreen()
                , label: {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.black)
                })
                Button(action: {
                    doSignOut()
                }, label: {
                    Image(systemName: "arrow.right.square")
                        .foregroundColor(.black)
                })
            })
            .navigationBarTitle("Contacts",displayMode: .inline)
            
        }.onAppear{
            apiContacts()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
