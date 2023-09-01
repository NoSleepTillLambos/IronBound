//
//  BioAuthView.swift
//  IronBound
//


import SwiftUI

struct BioAuthView: View {
    
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        
        ZStack {
            Color("BlueDark").ignoresSafeArea()
            Circle().scale(1.7).foregroundColor(.white.opacity(0.5))
            Circle()
                .scale(1.2)
                .foregroundColor(.white)
            
                
            Button(action: {
                if(authManager.biometricType == .none)
                {
                    // add creds
                } else {
                    Task.init {
                        await authManager.authWithBiometrics()
                    }
                    
                }
            }){
                
                VStack {
                    // change ui based on hardware of phone
                    if (authManager.biometricType == .faceID)
                    {
                        Image(systemName: "faceid").resizable().frame(width: 50, height: 50)
                                            Text("Login with FaceId").padding(.vertical).foregroundColor(Color("111009")).fontWeight(.bold).font(.system(size: 18))
                    } else if(authManager.biometricType == .touchID) {
                        Image(systemName: "touchid").resizable().frame(width: 50, height: 50)
                                            Text("Login with TouchId").padding(.vertical).foregroundColor(Color("111009")).fontWeight(.bold).font(.system(size: 18))
                    } else
                    {
                        Image(systemName: "ellipsis.rectangle").resizable().frame(width: 50, height: 50)
                                            Text("Login with credentials").padding(.vertical).foregroundColor(Color("111009")).fontWeight(.bold).font(.system(size: 18))
                    }
                    
                    
                }.padding().background(.white).cornerRadius(16).shadow(radius: 4)
            }
        }.alert(isPresented: $authManager.showAlert) {
            Alert(title: Text("Error"), message: Text(authManager.errorMessage), dismissButton: .default(Text("Okay")) )
        }
        
        }
        
    }


struct BioAuthView_Previews: PreviewProvider {
    static var previews: some View {
        BioAuthView()
    }
}
