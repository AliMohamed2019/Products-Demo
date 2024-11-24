//
//  BorderedButton.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import SwiftUI

struct BorderedButton: View {
    let title: String
    @Binding var isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: {
            onTap()
        }) {
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .padding(10)
                .background(isSelected ? Color.mauve.opacity(0.4) : Color.clear)
                .foregroundColor(Color.primaryColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.mauve, lineWidth: 2)
                )
                .cornerRadius(5)
        }
    }
}

struct BorderedButton_Previews: PreviewProvider {
    static var previews: some View {
        BorderedButton(title: "Fragrances", isSelected: .constant(false), onTap: {})
    }
}
