//
//  Payment.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 12/12/21.
//

import SwiftUI

struct Payment: View {
    var total : Int
    var body: some View {
        Button(action: {
            print("Pay button pressed...")
        }, label: {
            NavigationLink(destination: OrderPlaced()) {
                 Text("Pay $\(total)")      
            }
        })
    }
}

struct Payment_Previews: PreviewProvider {
    static var previews: some View {
        Payment(total: 10)
    }
}
