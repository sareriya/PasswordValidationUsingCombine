//
//  PasswordVerificationViewModel.swift
//  PasswordValidationWithCombine
//
//  Created by Gautam Sareriya on 05/06/23.
//

import Foundation
import Combine

final class PasswordVerificationViewModel: ObservableObject {

    //MARK: - Password input
    @Published var password: String = ""
    @Published var confirmPassword: String = ""

    //MARK: - Password verification
    @Published var hasEightChar = false
    @Published var hasSpecialChar = false
    @Published var hasOneDigit = false
    @Published var hasOneUpperCaseChar = false
    @Published var confirmationMatch = false
    @Published var areAllFieldsValid = false

    init() {
        passwordFields()
    }

    private func passwordFields() {

        // Password field validation using Combine
        // Minimum 8 characters
        $password
            .map { password in
                password.count >= 8
            }
            .assign(to: &$hasEightChar)

        //Has one special character
        $password
            .map { password in
                password.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#$%^&*()_+{}[]|\"<>,.~`/:;?-=\\¥'£•¢")) != nil
            }
            .assign(to: &$hasSpecialChar)

        //Has one digit
        $password
            .map { password in
               // password.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
                password.contains{$0.isNumber}
            }
            .assign(to: &$hasOneDigit)

        //Has one upper case character
        $password
            .map { password in
                //password.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil
                password.contains{$0.isUppercase}
            }
            .assign(to: &$hasOneUpperCaseChar)

        //Confirm password match
        $confirmPassword
            .combineLatest($password)
            .map { confirmPassword, password in
                (confirmPassword == password && !confirmPassword.isEmpty && !password.isEmpty)
            }
            .assign(to: &$confirmationMatch)

        //Check all fields are match
        Publishers.CombineLatest4($hasEightChar, $hasSpecialChar, $hasOneDigit, $hasOneUpperCaseChar)
            .map { hasEightChar, hasSpecialChar, hasOneDigit, hasOneUpperCaseChar in
                hasEightChar && hasSpecialChar && hasOneDigit && hasOneUpperCaseChar
            }
            .assign(to: &$areAllFieldsValid)

    }

}
