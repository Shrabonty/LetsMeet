//
//  SignInView.swift
//  LetsMeet
//
//  Created by Shrabonty Biswas on 17.04.24.
//

import SwiftUI

struct SignInView: View {
    
    @State var mobileNumber: String = ""
    @State var countryDialCode: String = "+880"
    
    @State private var presentCountryCode : Bool = false
    
    @State var searchText: String = ""
    
    @State private var isActive = false // Step 2
    
    //@ObservedObject var model = OtpView()
     
    var body: some View {
       
        NavigationView { // Step 1
            
            GeometryReader { geo in
                
                ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/){
                   
 
                    
                    //Logo
                    VStack(spacing:3){
                        Image(ImageName.appLogo)
                        .opacity(1.0)
                        .frame(width: 100, height: 118, alignment: .center)
                        .position(x: 180, y: 100)
                        //.offset(x: 20, y: -90)
                        .padding()
                        
                        Divider()
                        
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    }
                    
                    VStack(alignment: .center){
                        
                        //Sign in Text
                        VStack(alignment: .center){
                            
                            Text("Sign in")
                                .foregroundColor(.white)
                                .font(.title2)
                                .font(.system(size: 20))
                                .bold()
                                .padding(1)
                            
                            Text("Please provide your mobile number")
                                .foregroundColor(.white)
                                .font(.caption)
                                .font(.system(size: 16, weight: .semibold))
                                .kerning(1)
                            
                        }
                        .padding(.bottom)
                        
                        //country Code & mobile number
                        HStack{
                            
                            Button {
                                print("country picker")
                                self.presentCountryCode = true
                            } label: {
                                Text("\(countryDialCode)")
                                    .frame(minWidth: 80,minHeight: 47)
                                    .background(Color("PrimaryLight").cornerRadius(10))
                                    .foregroundColor(Color(.gray))
                                //  .padding(10)
                            }
                            ZStack(alignment: .center){
                                if mobileNumber.isEmpty{
                                    
                                    Text("Mobile Number").foregroundColor(Color.GrayText)
                                }
                                TextField(" ", text: $mobileNumber)
                                    .foregroundColor(.white)
                                
                            }
                            .frame(minWidth: 100,minHeight: 47)
                            .background(Color.PrimaryLight.cornerRadius(10))
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            
                        }
                        .frame(minWidth: 260,minHeight: 45)
                        .sheet(isPresented: $presentCountryCode){
                            
                            VStack{
                                
                                List(allCountryCodes){ model in
                                    HStack{
                                        
                                        //Text(model.flag)
                                        Text(model.name)
                                            .font(.body)
                                        
                                        Spacer()
                                        
                                        Text(model.number)
                                            .foregroundColor(Color(.systemGray2))
                                    }
                                    .onTapGesture{
                                        self.countryDialCode = model.number
                                        self.presentCountryCode = false
                                    }
                                }
                            }
                        }
                        
                        
                        VStack{
                            
                            NavigationLink( // Step 3
                            destination: SignUpView(),
                            isActive: $isActive
                            )
                            {
                            // your custom case that u talking about in question
                            // for example, with button its can be used like that:
                            Button(action: {
                                greeting()
                                isActive = true
                            }, label: {
                                Text("Submit")
                                    .frame(minWidth: 310,minHeight: 47)
                                    .background(Color.mainTaxt.cornerRadius(10))
                                    .foregroundColor(.white)
                                
                            })
                            }
                        }
                        VStack{
                            
                            NavigationLink( // This link goes to signUp page..
                            destination: SignUpView(),
                            isActive: $isActive
                            
                            ){
                                    Text("Create Account")
                                        .foregroundColor(.yellow)
                                        .padding(.top,30)
                               }
                            
                        }
                        
                    }
                    .frame(width: 311, height: 200, alignment: .center)
                    .padding(.horizontal,20)
                    .padding(.vertical,20)
                    .padding(.bottom, 70)
                        
                }
                .background(Color.Primary)
            }
            
            .ignoresSafeArea(.keyboard)
            .edgesIgnoringSafeArea(.bottom)
            //.navigationBarHidden(true)
            //.navigationTitle(" ")
       }

    }
    
    func greeting() {
            print("Hello, World!")
        }
    
    private var allCountryCodes : [CountryDailcode]{
        return CountryDailcode.allCountryCodes
    }
    
}

#Preview {
    SignInView()
}
