//
//  CategoryList.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 11/11/21.
//

import SwiftUI
//display list of categories
struct CategoryList: View {
    @State var isNavigationBarHidden: Bool = true
    var body: some View {
        NavigationView{
            List(categories) { Category in
                NavigationLink {
                    BookList(category: Category)        //go to booklist page and pass category so that next view can display category specific books
                }label:{
                    CategoryRow(category: Category)
                }
                .navigationBarTitle("Categories")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea([.top, .bottom])
            }
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
