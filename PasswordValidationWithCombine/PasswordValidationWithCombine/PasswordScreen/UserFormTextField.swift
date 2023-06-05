//
//  UserFormTextField.swift
//  PasswordValidationWithCombine
//
//  Created by Gautam Sareriya on 05/06/23.
//

import SwiftUI

enum UserPasswordType {
    case password, confirmPassword

    var title: String {
        switch self {
            case .password:
                return "Password"
            case .confirmPassword:
                return "Confirm Password"
        }
    }
}

struct UserFormTextField: View {

    @Binding var text: String
    var type: UserPasswordType

    var body: some View {
        VStack {
            SecureField("\(type.title)", text: $text)
                .font(.body)
        }
        .padding()
        .frame(height: 60)
        .overlay (
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray, lineWidth: 2)
        )
    }
}

struct UserFormTextField_Previews: PreviewProvider {
    static var previews: some View {
        UserFormTextField(text: .constant("default"), type: .password)
    }
}
