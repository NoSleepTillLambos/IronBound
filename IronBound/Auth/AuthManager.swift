//
//  AuthManager.swift
//  IronBound
//

import Foundation
import LocalAuthentication // face and touch id

class AuthManager: ObservableObject {
    private var context = LAContext()
    private var canEvaluatePolicy = false
    @Published var biometricType: LABiometryType = .none // see types
    
    @Published var isAuthenticated = false
    @Published var showAlert = false
    @Published var errorMessage = ""
    
    init()
    {
        getBioType()
    }
    
    func getBioType()
    {
        print("bio type recieved")
        canEvaluatePolicy = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        biometricType = context.biometryType
    }
    
    func authWithBiometrics() async
    {
        print("clicked")
        
            print("eval true")
            let reason = "Login with bio to keep your data safe"
            
            do
            {
                let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
                
                if (success) {
                    DispatchQueue.main.async {
                        // update auth
                        self.isAuthenticated = true
                    }
                }
            } catch
            {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    // update auth
                    self.isAuthenticated = false
                    self.biometricType = .none
                    self.showAlert = true
                    self.errorMessage = error.localizedDescription
                }
            
        }
    }
}
