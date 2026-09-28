//
//  DiagramaFotosView.swift
//  Tarea5-Departamento
//
//  Created by Ana Sofia Soqui on 28/09/26.
//

import SwiftUI

struct DiagramaFotosView: View {
    var departamento: Departamento
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Diagrama del departamento")
                        .font(.headline)

                    DiagramaView()

                    Text("Más fotos")
                        .font(.headline)

                    ForEach(departamento.fotos.indices, id: \.self) { index in
                        Image(departamento.fotos[index])
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(15)
                    }

                    Button(action: {
                        dismiss()
                    }) {
                        Text("Cerrar")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .padding()
            }
            .navigationTitle("Diagrama y fotos")
        }
    }
}

