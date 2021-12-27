//
//  Homepage.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 11/24/21.
//

import SwiftUI
//Mainpage
struct Homepage: View {
    @State private var navigateTo = ""
    @State private var isActive = false
    @State var booklist : [Bookshelf] = bookshelfs
    var database = Database()
    
    var body: some View {
        NavigationView{
            List(bookshelfs) { Bookshelf in
                    NavigationLink {
                        BookDetail(bookshelf: Bookshelf)        //when user clicks on specfic book go to bookdetail page
                    }label:{
                        HomepageRow(bookshelf: Bookshelf)
                    }
                    
            }
            //NavigationLink(destination: CategoryList()) {
            //Text("Categories1")
            .navigationBarTitle("Home")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    HStack{
                        Button(action: {
                            print("Categories button pressed...")
                        }, label: {
                            NavigationLink(destination: CategoryList()) {
                                 Text("Categories")
                            }
                        })
                        Button(action: {
                            print("Cart button pressed...")
                            
                        }, label: {
                            NavigationLink(destination: Cart()) {
                                 Text("Cart")
                            }
                        })
                        Button(action: {
                            print("Logout button pressed...")
                            goLogin()
                        }) {
                            Text("Logout")
                        }
                    }
                }
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
    //function to go to login page once user clicks logout
    func goLogin() {
        if let window = UIApplication.shared.windows.first {
                window.rootViewController = UIHostingController(rootView: Login())
                window.makeKeyAndVisible()
            }
        
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}

/*
toolbar
 Button(action: {
     print("Categories button pressed...")
 }, label: {
     NavigationLink(destination: CategoryList()) {
          Text("Categories")
     }
 })
 Button(action: {
     print("Profile button pressed...")
     }) {
     Text("Profile")
 }
 Button(action: {
     print("Cart button pressed...")
 }) {
     Text("Cart")
 }
 Menu
Menu(content: {
    Button(action: {
        print("check")
        self.isActive.toggle()
    }){
        Text("Show detail")
    }.sheet(isPresented: $isActive){
        CategoryList()
    }
    Button("Profile", action: {
        print("Profile page")
    })
    Button("Cart", action: {
        print("Go to cart")
    })
    Button("Log out", action: {
        print("Log out of account")
    })
}, label: {
    //Text("Menu")
    Image(systemName: "ellipsis.circle")
                                    .font(.system(size: 21))
//                        .background(
//                            NavigationLink(destination: Text(self.navigateTo), isActive: $isActive) {
//                                                                            EmptyView()
//                        })
})
*/
