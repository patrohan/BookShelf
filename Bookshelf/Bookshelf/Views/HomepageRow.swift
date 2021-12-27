//
//  HomepageRow.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 11/24/21.
//

import SwiftUI
//Individual row structure for Homepage
struct HomepageRow: View {
    var bookshelf: Bookshelf
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2){
            bookshelf.image
                .resizable()
                .frame(width: 210, height: 210)
            Text(bookshelf.name).font(.title)
            Text("By \(bookshelf.author)").font(.subheadline)
            Text("$" + String(bookshelf.price)).font(.subheadline)

            //Spacer()
        }
    }
}

struct HomepageRow_Previews: PreviewProvider {
    static var previews: some View {
        HomepageRow(bookshelf: bookshelfs[0])
    }
}
