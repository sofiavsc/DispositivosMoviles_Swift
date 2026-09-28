//
//  DiagramaView.swift
//  Tarea5-Departamento
//
//  Created by Ana Sofia Soqui on 28/09/26.
//

import SwiftUI

struct CuartoView: View {
    var nombre: String
    var color: Color
    var ancho: CGFloat
    var alto: CGFloat

    var body: some View {
        ZStack {
            Rectangle()
                .fill(color.opacity(0.3))
            Rectangle()
                .stroke(Color.black, lineWidth: 2)
            Text(nombre)
                .font(.caption)
                .bold()
        }
        .frame(width: ancho, height: alto)
    }
}

struct DiagramaView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                CuartoView(nombre: "Recámara", color: .blue, ancho: 180, alto: 120)
                CuartoView(nombre: "Baño", color: .green, ancho: 120, alto: 120)
            }
            HStack(spacing: 0) {
                CuartoView(nombre: "Cocina", color: .orange, ancho: 120, alto: 80)
                CuartoView(nombre: "Sala", color: .yellow, ancho: 180, alto: 80)
            }
        }
    }
}

