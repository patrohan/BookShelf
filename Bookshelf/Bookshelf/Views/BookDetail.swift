//
//  BookDetail.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 11/11/21.
//

import SwiftUI
//Detail of book page
struct BookDetail: View {
    var bookshelf : Bookshelf
    var store = BookStore.get()
    var book : Bookshelf!
    var db : OpaquePointer?
    var database = Database()
    @State var isModal: Bool = false
    
    var body: some View {
        ScrollView {
            Image("\(bookshelf.imageName)")
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 4)
                    .padding(.bottom, -10)
                    .frame(alignment: .center)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Text(bookshelf.name)
                        .font(.title)

                    HStack {
                        Text("By \(bookshelf.author)")
                        Spacer()
                        Text("$"+String(bookshelf.price))
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                    Divider()

                    Text("About \(bookshelf.name)")
                        .font(.title2)
                    Text(bookshelf.description)
                    
                    Divider()
                    
                    VStack{
                        HStack{
                            Text("Language: \(bookshelf.language)")
                            Spacer()
                            Text("Rating: \(bookshelf.rating)")
                        }
                        
                        Button(action: {
                            print("Cart button pressed...")
                            //add to cart
                            GlobalArrayManager.shared.addDataInArray(data: bookshelf.id)
                            GlobalArrayManager.shared.addTotal(price : bookshelf.price)
                            print(GlobalArrayManager.shared.getArray())
                            print(GlobalArrayManager.shared.getTotal())
                        }, label: {
//                            NavigationLink(destination: Cart()) {
//                                 Text("Add to Cart")
//                            }
                            Text("Add to Cart")
                        })
                            .padding()
                            .background(.black)
                            .clipShape(Capsule())
                    }
                    .navigationTitle(bookshelf.name)
                    .navigationBarTitleDisplayMode(.inline)
                }
        }.padding()
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(bookshelf: bookshelfs[0])
    }
}

/*
 //                      Button(action: {
 //                          print("Save btn clicked")
 //                          database.insertbookTable(id: bookshelf.id, name: bookshelf.name, author: bookshelf.author, price: bookshelf.price, description: bookshelf.description, category: bookshelf.category, image_name: bookshelf.imageName, pdflink: bookshelf.pdflink, language: bookshelf.language, rating: bookshelf.rating)
 //                      }) {
 //                          Text("Save")
 //                      }
                         
//add data to database
let bookObj = Bookshelf(id: 1, name:"Let us C", author:"Yashwant Kanetkar", price: "$15", description: "Let Us C is a popular introductory book to the world of C programming. Its simple and approachable style has kept it a popular resource for newbies for many years. Summary of The Book With the expanding horizon of digital technology, there is also an increasing need for software professionals with a good command of a variety of programming languages. The C language is one of the basic skill sets in a programmers portfolio. There has been an explosion in the number of programming languages and different development platforms. However, the C programming language has retained its popularity across the decades. Let Us C is a great resource from which one can learn C programming. It does not assume any previous knowledge of C or even the basics of programming. It covers everything from basic programming concepts and fundamental C programming constructs. The book explains basic concepts like data types and control structures, decision control structure and loops, creating functions and using the standard C library. It also covers C preprocessor directives, handling strings, and error handling. It also discusses C programming under different environments like Windows and Linux. The book uses a lot of programming examples to help the reader gain a deeper understanding of the various C features. This book also aims to help prepare readers not just for the theoretical exams, but also the practical ones. It builds their C programming skills. It also helps in getting through job interviews. There is a separate section in the book that discusses the most Frequently Asked Questions in job interviews", category: "Educational", imageName: "turtlerock", pdflink: "http://pdvpmtasgaon.edu.in/uploads/dptcomputer/Let%20us%20c%20-%20yashwantkanetkar.pdf")
 let bookObj1 = Bookshelf(id: 1, name:"Let us C", author:"Yashwant Kanetkar", price: "$15", description: "Let Us C is a popular introductory book to the world of C programming. Its simple and approachable style has kept it a popular resource for newbies for many years. Summary of The Book With the expanding horizon of digital technology, there is also an increasing need for software professionals with a good command of a variety of programming languages. The C language is one of the basic skill sets in a programmers portfolio. There has been an explosion in the number of programming languages and different development platforms. However, the C programming language has retained its popularity across the decades. Let Us C is a great resource from which one can learn C programming. It does not assume any previous knowledge of C or even the basics of programming. It covers everything from basic programming concepts and fundamental C programming constructs. The book explains basic concepts like data types and control structures, decision control structure and loops, creating functions and using the standard C library. It also covers C preprocessor directives, handling strings, and error handling. It also discusses C programming under different environments like Windows and Linux. The book uses a lot of programming examples to help the reader gain a deeper understanding of the various C features. This book also aims to help prepare readers not just for the theoretical exams, but also the practical ones. It builds their C programming skills. It also helps in getting through job interviews. There is a separate section in the book that discusses the most Frequently Asked Questions in job interviews", category: "Educational", imageName: "turtlerock", pdflink: "http://pdvpmtasgaon.edu.in/uploads/dptcomputer/Let%20us%20c%20-%20yashwantkanetkar.pdf")
db.insertbookTable(bookObj: bookObj)
*/
