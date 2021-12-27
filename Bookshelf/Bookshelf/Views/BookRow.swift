//
//  BookRow.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 11/11/21.
//

import SwiftUI
//Individual row structure for booklist
struct BookRow: View {
    var bookshelf: Bookshelf

    var body: some View {
        HStack {
            bookshelf.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(bookshelf.name)

            Spacer()
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
                BookRow(bookshelf: bookshelfs[0])
                BookRow(bookshelf: bookshelfs[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}


