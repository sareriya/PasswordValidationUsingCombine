//
//  PasswordValidation.swift
//  PasswordValidationWithCombine
//
//  Created by Gautam Sareriya on 05/06/23.
//

import SwiftUI

struct PasswordValidation: View {

    @StateObject private var passwordViewModel = PasswordVerificationViewModel()

    var body: some View {

        VStack (spacing: 0) {
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Password")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Password must have more than 8 characters, contain one special character, one digit, one uppercase letter.")
                        .font(.caption)
                }
                Group {
                    UserFormTextField(text: $passwordViewModel.password, type: .password)
                    VStack(alignment: .leading) {
                        CheckboxPickerView(type: .eightChar, toggleState: $passwordViewModel.hasEightChar)
                        CheckboxPickerView(type: .spacialChar, toggleState: $passwordViewModel.hasSpecialChar)
                        CheckboxPickerView(type: .oneDigit, toggleState: $passwordViewModel.hasOneDigit)
                        CheckboxPickerView(type: .upperCaseChar, toggleState: $passwordViewModel.hasOneUpperCaseChar)
                    }
                    UserFormTextField(text: $passwordViewModel.confirmPassword, type: .confirmPassword)
                    CheckboxPickerView(type: .confirmation, toggleState: $passwordViewModel.confirmationMatch)
                }.padding(.vertical, 5)
                Spacer()

                Button(action: {
                    passwordViewModel.areAllFieldsValid = true
                }, label: {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                .disabled(!passwordViewModel.areAllFieldsValid)
            }
            .padding()
        }
    }
}

struct PasswordValidation_Previews: PreviewProvider {
    static var previews: some View {
        PasswordValidation()
    }
}
