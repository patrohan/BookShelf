//
//  Cart.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 12/10/21.
//

import SwiftUI

struct Cart: View {
    var cart = GlobalArrayManager.shared.getArray()
    var check = [2,4]
    @State var total = 0;
    
    var body: some View {
        VStack{
            Text("Cart")
            
            Spacer()
            //table view
            List(bookshelfs){ Bookshelf in
                if(GlobalArrayManager.shared.getArray().contains(Bookshelf.id) == true){
                    //total = total + Bookshelf.price
                    CartRow(bookshelf: Bookshelf)
                }
            }
            
            Spacer()
            
            //Text("Total: $" + String(bookshelfs.map{$0.price}.reduce(0, +)))
            Text("Total: $" + String(GlobalArrayManager.shared.getTotal()))
            
            Spacer()
            
            Button(action: {
                print("Proceed button pressed...")
                print(GlobalArrayManager.shared.getArray())
                print(bookshelfs[0].id)
            }, label: {
                NavigationLink(destination: Payment(total : GlobalArrayManager.shared.getTotal())) {
                     Text("Proceed to Pay")
                }
            })
        }
        
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
    }
}
