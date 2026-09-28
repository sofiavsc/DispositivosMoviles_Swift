//
//  DepartamentosView.swift
//  Tarea4-Binding
//
//  Created by Ana Sofia Soqui on 25/09/26.
//

import SwiftUI

struct DepartamentoView: View {
    @Binding var departamento: Departamento
    var index: Int
    @Binding var reservadoIndex: Int
    var onFavoritoChanged: (String) -> Void

    var isReservado: Bool {
        reservadoIndex == index
    }

    var body: some View {
        HStack(spacing: 15) {
            Image(departamento.imagen)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 4) {
                Text(departamento.ubicacion)
                    .font(.headline)
                Text(departamento.habitacion)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("\(departamento.precio) al mes • \(departamento.metros) m2")
                    .font(.caption)
            }

            Spacer()

            VStack(spacing: 12) {
                Button(action: {
                    withAnimation {
                        departamento.isFavorito.toggle()
                    }
                    onFavoritoChanged(departamento.ubicacion)
                }) {
                    Image(systemName: departamento.isFavorito ? "heart.fill" : "heart")
                        .foregroundColor(departamento.isFavorito ? .red : .gray)
                        .font(.title3)
                }

                Button(action: {
                    withAnimation {
                        if isReservado {
                            reservadoIndex = -1
                        } else {
                            reservadoIndex = index
                        }
                    }
                }) {
                    Text(isReservado ? "Reservado" : "Reservar")
                        .font(.caption)
                        .bold()
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(isReservado ? Color.green : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .departamentoCardStyle()
    }
}
