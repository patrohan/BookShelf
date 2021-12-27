//
//  Login.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 12/1/21.
//

import SwiftUI

struct Login: View {
    @State var email = ""
    @State var password = ""
    @Namespace var animation
    var database = Database()
    @State var show = false
    @State var booklist = [Bookshelf]()
    
    var body: some View {
        
        VStack{
            
            Spacer(minLength: 0)
            
            HStack{
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Login")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(.primary)
                    
                    Text("Please sign in to continue")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.leading)
            
            CustomTxtField(image: "envelope", title: "EMAIL", value: $email, animation: animation)
                .textInputAutocapitalization(.never)
            
            CustomTxtField(image: "lock", title: "PASSWORD", value: $password, animation: animation)
                .padding(.top,5)
                .textInputAutocapitalization(.never)
            
            HStack{
                
                Spacer(minLength: 0)
                
                VStack(alignment: .trailing, spacing: 20){
                    Button(action: {}){
                        
                        Text("FORGOT PASSWORD?")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("blue"))
                    }
                    
                    Button(action: {
                        var pass = database.getcustomer(email: email)
                        if(pass == password){
                            //load data and goto homepage
                            booklist = database.getbooks()
                            print("checkkk-------")
                            print(booklist.count)
                            goHome()
                        }else{
                            print("Invalid id or password")
                        }
                    }){
                        
                        HStack(spacing: 10){
                            
                            Button(action: {
                                var pass = database.getcustomer(email: email)   //get password of customer from db for verfification
                                if(pass == password){               //validation of customer's credentials
                                    print("password verified")
                                    //booklist = database.getbooks()
                                    print("checkkk-------")
                                    //print(booklist.count)
                                    goHome()
                                }else{
                                    print("invalid pass or id")
                                }
                                
                            }) {
                                HStack(alignment: .center) {
                                    Spacer()
                                    Text("Login").foregroundColor(Color.white).bold()
                                    Spacer()
                                }
                            }
                            
//                            NavigationLink(destination: Homepage()) {
//                                Text("LOGIN")
//                                    .fontWeight(.heavy)
//                            }.disabled(email != "abcd@gmail.com" && password != "abcd")
                            
                            Image(systemName: "arrow.right")
                                .font(.title2)
                        }
                        .modifier(CustomButtonModifier())
                    }
                }
            }
            .padding()
            .padding(.top,10)
            .padding(.trailing)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 8){
                Text("Don't have an account?")
                    .fontWeight(.heavy)
                    .foregroundColor(.gray)
                
                NavigationLink(destination: Register(show: $show), isActive: $show){
                    
                        Text("Sign up")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("blue"))
                    
                }
            }
            .padding()
        }
        
    }
    func goHome() {
        if let window = UIApplication.shared.windows.first {
                window.rootViewController = UIHostingController(rootView: Homepage())
                window.makeKeyAndVisible()
            }
        
    }
}
