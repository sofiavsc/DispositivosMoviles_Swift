//
//  DetalleDepartamentoView.swift
//  Tarea5-Departamento
//
//  Created by Ana Sofia Soqui on 28/09/26.
//

import SwiftUI

struct DetalleDepartamentoView: View {
    var departamento: Departamento
    @State private var mostrarModal = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(departamento.imagen)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)

                Text(departamento.ubicacion)
                    .font(.title2)
                    .bold()

                Text("\(departamento.precio) al mes • \(departamento.metros) m2")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text("Características")
                    .font(.headline)

                ForEach(departamento.caracteristicas.indices, id: \.self) { index in
                    HStack(spacing: 10) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                        Text(departamento.caracteristicas[index])
                    }
                }

                Button(action: {
                    mostrarModal.toggle()
                }) {
                    Text("Ver diagrama y más fotos")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationTitle("Detalles")
        .sheet(isPresented: $mostrarModal) {
            DiagramaFotosView(departamento: departamento)
        }
    }
}
