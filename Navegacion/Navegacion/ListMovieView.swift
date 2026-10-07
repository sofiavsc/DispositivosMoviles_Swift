//
//  ListMovieView.swift
//  Navegacion
//
//  Created by Ana Sofia Soqui on 14/09/26.
//

import SwiftUI

struct ListMovieView: View {
    let peliculas: [Pelicula] = [
        Pelicula(nombre: "Top Gun", imagen: "topgun", anio: 2022, genero: "Acción/Aventura", duracion: "2h 11min"),
        Pelicula(nombre: "Anyone But You", imagen: "anyonebutyou", anio: 2023, genero: "Romance/Comedia", duracion: "1h 43min"),
        Pelicula(nombre: "Gran Turismo", imagen: "granturismo", anio: 2023, genero: "Sport/Acción", duracion: "2h 14min"),
        Pelicula(nombre: "Spider-Man: Un Nuevo Día", imagen: "spiderman", anio: 2026, genero: "Sci-Fi", duracion: "2h 30min")
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(peliculas.indices, id: \.self) { index in
                    NavigationLink(destination: SinopsisView(pelicula: peliculas[index])) {
                        VStack {
                            Image(peliculas[index].imagen)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, height: 270)
                                .cornerRadius(12)
                                .shadow(radius: 4)

                            Text(peliculas[index].nombre)
                                .font(.title3)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.center)

                            Text("Ver Sinopsis")
                                .foregroundStyle(Color.blue)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack {
        ListMovieView()
    }
}
