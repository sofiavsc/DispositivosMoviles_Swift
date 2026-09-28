//
//  ContentView.swift
//  Tarea4-Binding
//
//  Created by Ana Sofia Soqui on 25/09/26.
//

import SwiftUI

struct ContentView: View {
    @State private var departamentos: [Departamento] = [
        Departamento(ubicacion: "Cumbres Loft 12 – San Pedro Garza García", habitacion: "1F", precio: "$25,000", metros: "29.53", imagen: "depa1"),
        Departamento(ubicacion: "Torre Valle Alto – Valle Oriente", habitacion: "4F", precio: "$17,300", metros: "27.53", imagen: "depa2"),
        Departamento(ubicacion: "Residencial Obispado – Barrio Antiguo", habitacion: "8F", precio: "$14,960", metros: "26.15", imagen: "depa3"),
        Departamento(ubicacion: "Distrito Tec Suites – Tecnológico", habitacion: "5F", precio: "$16,400", metros: "25.08", imagen: "depa4"),
        Departamento(ubicacion: "Mirador San Jerónimo – San Jerónimo", habitacion: "2F", precio: "$21,000", metros: "24.00", imagen: "depa5")
    ]

    @State private var reservadoIndex: Int = -1
    @State private var marcarTodos: Bool = false

    @State private var mostrarAlerta: Bool = false
    @State private var mensajeAlerta: String = ""

    var todosFavoritos: Bool {
        var todos = true
        for departamento in departamentos {
            if !departamento.isFavorito {
                todos = false
            }
        }
        return todos
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Toggle("Marcar todos como favoritos", isOn: $marcarTodos)
                    .padding()
                    .onChange(of: marcarTodos) { _, nuevoValor in
                        withAnimation {
                            for index in departamentos.indices {
                                departamentos[index].isFavorito = nuevoValor
                            }
                        }
                    }

                ScrollView {
                    VStack(spacing: 15) {
                        if todosFavoritos {
                            GroupBox {
                                Text("Todos han sido marcados")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .padding(.horizontal)
                        }

                        ForEach(departamentos.indices, id: \.self) { index in
                            DepartamentoView(
                                departamento: $departamentos[index],
                                index: index,
                                reservadoIndex: $reservadoIndex,
                                onFavoritoChanged: { ubicacion in
                                    if !marcarTodos {
                                        mensajeAlerta = "Departamento de \(ubicacion) ha sido establecido como preferido exitosamente"
                                        mostrarAlerta = true
                                    }
                                }
                            )
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Departamentos")
            .alert(isPresented: $mostrarAlerta) {
                Alert(title: Text("Favorito"),
                      message: Text(mensajeAlerta),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    ContentView()
}
