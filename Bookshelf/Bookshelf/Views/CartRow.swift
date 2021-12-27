//
//  CartRow.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 12/11/21.
//

import SwiftUI
//individual row structure of cart
struct CartRow: View {
    var bookshelf: Bookshelf
    var body: some View {
        HStack {
            bookshelf.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(bookshelf.name)

            Spacer()
            
            Text("$"+String(bookshelf.price))
        }
    }
}

struct CartRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
                CartRow(bookshelf: bookshelfs[0])
                CartRow(bookshelf: bookshelfs[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
