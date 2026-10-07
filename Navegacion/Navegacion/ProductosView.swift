//
//  ProductosView.swift
//  Navegacion
//
//  Created by Ana Sofia Soqui on 02/10/26.
//

import SwiftUI
import AVFoundation //Es la librería que sirve reproducir los sonidos

struct ProductosView: View {
    var categoria: CategoriaAlimento
    @State private var player: AVAudioPlayer?
    @State private var productoConfirmado: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ForEach(categoria.productos.indices, id: \.self) { index in
                    let producto = categoria.productos[index]

                    HStack(spacing: 15) {
                        Image(producto.imagen)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(producto.nombre)
                                .font(.headline)
                            Text(producto.precio)
                                .foregroundColor(.gray)
                        }

                        Spacer()

                        Button(action: {
                            reproducirSonido(nombreArchivo: producto.sonido)
                            productoConfirmado = producto.nombre
                        }) {
                            Text("Confirmar")
                                .font(.caption)
                                .bold()
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                }

                if !productoConfirmado.isEmpty {
                    Text("Seleccionaste: \(productoConfirmado)")
                        .font(.footnote)
                        .foregroundColor(.green)
                        .padding(.top, 10)
                }
            }
            .padding(.vertical)
        }
        .navigationTitle(categoria.nombre)
    }

    func reproducirSonido(nombreArchivo: String) {
        let extensionArchivo: String = "mp3"
        guard let ubicacionSonido = Bundle.main.url(forResource: nombreArchivo, withExtension: extensionArchivo) else {
            print("No se encontró el archivo de sonido. Revisar este en el proyecto")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: ubicacionSonido)
            self.player?.play()
        } catch {
            print("Error al cargar el sonido: \(error)")
        }
    }
}
