//
//  RegisteredView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//

import SwiftUI

struct RegisteredView: View {
    @State private var name = ""
    private var isValidName: Bool {
        return self.name.count >= 3 ? true : false
    }
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)

                Text("\(name.count)")
                    .foregroundColor(isValidName ? .green : .red)
            }
            
            Button(action: { user.register(name: name) }) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!isValidName)
        }
        .padding()
    }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisteredView()
            .environmentObject(UserManager())
    }
}
