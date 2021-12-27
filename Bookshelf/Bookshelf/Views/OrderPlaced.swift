//
//  OrderPlaced.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 11/29/21.
//

import SwiftUI

struct OrderPlaced: View {
    var body: some View {
        VStack{
        
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 3)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color("Black"))
                    
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.white)
                    
                }
                
                    Text("Order Placed Successfully").bold()
            }
            
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 200, height: 60)
                    .foregroundColor(Color("Blue"))
                Text("DOWNLOAD BOOKS FROM LINKS BELOW!").bold()
            }
            
            List(bookshelfs){ Bookshelf in
                if(GlobalArrayManager.shared.getArray().contains(Bookshelf.id) == true){
                    //total = total + Bookshelf.price
                    OrderPlacedRow(bookshelf: Bookshelf)
                }
            }
            
            //go to homepage once files are downloaded
            Button(action: {
                print("Homepage button pressed...")
                GlobalArrayManager.shared.clearCart()
                //GlobalArrayManager.shared.cart.removeAll()
                print(GlobalArrayManager.shared.getTotal())
                goHomepage()
            }, label: {
//                NavigationLink(destination: Homepage()) {
//                     Text("Go to Homepage")
//                }
                Text("Go to homepage")
            })
        }
    }
    //function to goto Homepage once user downloads all books and clicks on 'Go to homepage'
    func goHomepage() {
        if let window = UIApplication.shared.windows.first {
                window.rootViewController = UIHostingController(rootView: Homepage())
                window.makeKeyAndVisible()
            }
        
    }
}

struct OrderPlaced_Previews: PreviewProvider {
    static var previews: some View {
        OrderPlaced()
    }
}
