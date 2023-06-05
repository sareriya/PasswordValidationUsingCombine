//
//  CheckboxPickerView.swift
//  PasswordValidationWithCombine
//
//  Created by Gautam Sareriya on 05/06/23.
//

import SwiftUI

enum CheckboxPickerType {
    case eightChar, spacialChar, oneDigit, upperCaseChar, confirmation

    var title: String {
        switch self {
            case .eightChar:
                return "Minimum 8 characters"
            case .spacialChar:
                return "Has one special character"
            case .oneDigit:
                return "Has one digit"
            case .upperCaseChar:
                return "Has one upper case character"
            case .confirmation:
                return "The password and confirmation must match"
        }
    }
}


struct CheckboxPickerView: View {
    var type: CheckboxPickerType
    @Binding var toggleState: Bool

    var body: some View {
        HStack {
            Toggle("", isOn: $toggleState.animation(.easeInOut))
                .toggleStyle(CheckboxToggleStyle())
                .disabled(true)
                .frame(width: 30, height: 30)
            Text(type.title.description)
                .font(.headline)
            Spacer()
        }
    }
}

struct CheckboxPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxPickerView(type: .eightChar, toggleState: .constant(false))
    }
}
