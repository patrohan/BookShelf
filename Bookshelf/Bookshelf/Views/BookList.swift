//
//  BookList.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 11/11/21.
//

import SwiftUI
//It is used to dsiplay List of Books according to specific category
struct BookList: View {
    //var bookshelf : Bookshelf
    var category : CategoryShelf
    var body: some View {
        
            NavigationView{
                List(bookshelfs) { Bookshelf in
                    if(Bookshelf.category == category.name){        //check if book belongs to category selected by user
                        NavigationLink {
                            BookDetail(bookshelf: Bookshelf)
                        }label:{
                            BookRow(bookshelf: Bookshelf)
                        }
                        .navigationBarTitle("\(category.name) Books")
                        .navigationBarTitleDisplayMode(.inline)
                        .edgesIgnoringSafeArea([.top, .bottom])
                    }
                }
            }

        
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList(category: categories[0])
    }
}
