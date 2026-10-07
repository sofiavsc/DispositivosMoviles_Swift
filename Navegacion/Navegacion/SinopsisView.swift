//
//  SinopsisView.swift
//  Navegacion
//
//  Created by Ana Sofia Soqui on 14/09/26.
//

import SwiftUI

struct SinopsisView: View {
    var pelicula: Pelicula
    @State private var boletoComprado: Bool = false

    var body: some View {
        VStack {
            Image(pelicula.imagen)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 400)
                .cornerRadius(12)

            Text(pelicula.nombre)
                .font(.title2)
                .bold()
                .padding(.top, 10)

            HStack {
                Text("\(pelicula.anio)")
                Spacer()
                Text(pelicula.duracion)
                Spacer()
                Text(pelicula.genero)
                Spacer()
            }
            .padding(60)

            Button(action: {
                boletoComprado = true
            }) {
                Text(boletoComprado ? "Boleto comprado ✓" : "Comprar boleto")
                    .foregroundColor(.white)
                    .padding()
                    .background(boletoComprado ? Color.green : Color.blue)
                    .cornerRadius(10)
            }
            .disabled(boletoComprado)

            NavigationLink(destination: CategoriasAlimentosView()) {
                Text("Ver dulcería")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding(.top, 10)
        }
    }
}

#Preview {
    SinopsisView(pelicula: Pelicula(nombre: "Anyone But You", imagen: "anyonebutyou", anio: 2023, genero: "Romance/Comedia", duracion: "1h 43min"))
}
