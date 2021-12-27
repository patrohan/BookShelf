//
//  Register.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 12/1/21.
//

import SwiftUI

struct Register: View {
    
    @State var name = ""
    @State var address = ""
    @State var number = ""
    @State var email = ""
    @State var password = ""
    @State var conpass = ""
    
    var store = CustomerStore.get()
    var customer : Customer!
    var database = Database()
    
    
    @Binding var show: Bool
    
    @Namespace var animation
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack{
                
                HStack{
                    
                    Button(action: {show.toggle()}){
                        
                        Image(systemName: "arrow.left")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                .padding()
                .padding(.leading)
                
                HStack{
                    
                    Text("Create Account")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                    
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.leading)
                
                CustomTxtField(image: "person",title: "ENTER FULL NAME", value: $name, animation: animation)
                    .textInputAutocapitalization(.never)
                
                CustomTxtField(image: "house",title: "ENTER ADDRESS", value: $address, animation: animation)
                    .padding(.top,5)
                    .textInputAutocapitalization(.never)
                
                CustomTxtField(image: "phone.fill",title: "ENTER PHONE NUMBER", value: $number, animation: animation)
                    .padding(.top,5)
                
                CustomTxtField(image: "envelope",title: "ENTER EMAIL", value: $email, animation: animation)
                    .padding(.top,5)
                    .textInputAutocapitalization(.never)
                
                CustomTxtField(image: "lock",title: "ENTER PASSWORD", value: $password, animation: animation)
                    .padding(.top,5)
                    .textInputAutocapitalization(.never)
                
                
                CustomTxtField(image: "lock",title: "CONFIRM PASSWORD", value: $conpass, animation: animation)
                    .padding(.top,5)
                    .textInputAutocapitalization(.never)
                
                
                HStack{
                    
                    Spacer()
                    
                    Button(action: {
                        if(name.isEmpty == true || address.isEmpty == true || number.isEmpty == true || email.isEmpty == true || password.isEmpty == true || conpass.isEmpty == true){
                            print("Please fill all fields to signup")
                        }else if(password != conpass){
                            print("passwords don't match")
                        }else{
                            print(name)
                            database.insertcustomerTable(name: name, email: email, address: address, number: number, password: password)        //insert customer entry into table
                            print("sign up successful")
                            let alert = UIAlertController(title: "Alert", message: "sign up successful", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                            //self.present(alert, animation: true)
                        }
                        
                        
                    }){
                        
                        HStack(spacing: 10){
                            
                            Text("SIGN UP")
                                .fontWeight(.heavy)
                            
                            Image(systemName: "arrow.right")
                                .font(.title2)
                        }
                        .modifier(CustomButtonModifier())
                    }
                }
                .padding()
                .padding(.top)
                .padding(.trailing)
                
                HStack{
                    
                    Text("Already have an account?")
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)
                    
                    Button(action: {show.toggle()}){
                        
                        Text("Sign in")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("blue"))
                    }
                }
                .padding()
                .padding(.top,10)
                
                
                //Spacer(minLength: 0)
                
            }
            
        })
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

