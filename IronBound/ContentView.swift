//
//  ContentView.swift
//  IronBound

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showLoginScreen = false
    
    
    var body: some View {
        NavigationView{
            ZStack {
                Color("BlueDark").ignoresSafeArea()
                Circle().scale(1.7).foregroundColor(.white.opacity(0.5))
                Circle()
                    .scale(1.2)
                    .foregroundColor(.white)
                
                VStack{
                    Text("Login").font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username).padding().frame(width: 320, height: 50)
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    SecureField("Password", text: $password).padding().frame(width: 320, height: 50)
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    Button("Login") {
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color("BlueDark"))
                    .cornerRadius(10)
                    
                    NavigationLink(destination: ContentView(), isActive: $showLoginScreen){
                        
                    }
                }
            }
        }.navigationBarHidden(true)
    }
    
    func authUser(username: String, password: String) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
