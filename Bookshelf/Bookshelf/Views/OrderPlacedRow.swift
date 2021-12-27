//
//  OrderPlacedRow.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 12/12/21.
//

import SwiftUI

struct OrderPlacedRow: View {
    var bookshelf: Bookshelf
    
    var body: some View {
        HStack {
            Text(bookshelf.name)

            Spacer()
            
            //Text("[Download](${bookshelf.pdflink})")
            Link("Download", destination: URL(string :bookshelf.pdflink)!)
        }
    }
}

struct OrderPlacedRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OrderPlacedRow(bookshelf: bookshelfs[0])
            OrderPlacedRow(bookshelf: bookshelfs[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
