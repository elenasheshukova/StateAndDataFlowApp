//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 22.10.2020.
//

import Foundation
import Combine

class UserManager: ObservableObject {
    private let userDefaults = UserDefaults.standard
    private let userNameKey = "userName"
    @Published var isRegister = false
    var name = ""
    
    init() {
        if let userName = userDefaults.value(forKey: userNameKey) as? String, userName != "" {
            login(name: userName)
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    func register(name: String){
        userDefaults.set(name, forKey: userNameKey)
        login(name: name)
    }
    
    func login(name: String){
        self.name = name
        isRegister = true
    }
    
    func logOut(){
        userDefaults.set("", forKey: userNameKey)
        self.name = ""
        isRegister = false
    }
}
