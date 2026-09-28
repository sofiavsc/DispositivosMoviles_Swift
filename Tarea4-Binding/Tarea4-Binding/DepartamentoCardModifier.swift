//
//  DepartamentoCardModifier.swift
//  Tarea4-Binding
//
//  Created by Ana Sofia Soqui on 25/09/26.
//

import SwiftUI

struct DepartamentoCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.colorDepas))
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            .padding(.horizontal)
    }
}

extension View {
    func departamentoCardStyle() -> some View {
        self.modifier(DepartamentoCardModifier())
    }
}
