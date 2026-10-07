//
//  CategoriaAlimentoView.swift
//  Navegacion
//
//  Created by Ana Sofia Soqui on 02/10/26.
//

import SwiftUI

struct CategoriasAlimentosView: View {
    let categorias: [CategoriaAlimento] = [
        CategoriaAlimento(nombre: "Palomitas", productos: [
            Producto(nombre: "Palomitas Chicas", precio: "$45", imagen: "palomitas", sonido: "sonido_palomitas"),
            Producto(nombre: "Palomitas Grandes", precio: "$65", imagen: "palomitas", sonido: "sonido_palomitas")
        ]),
        CategoriaAlimento(nombre: "Bebidas", productos: [
            Producto(nombre: "Refresco Chico", precio: "$35", imagen: "refresco", sonido: "sonido_refresco"),
            Producto(nombre: "Refresco Grande", precio: "$50", imagen: "refresco", sonido: "sonido_refresco")
        ]),
        CategoriaAlimento(nombre: "Dulces", productos: [
            Producto(nombre: "Nachos", precio: "$55", imagen: "nachos", sonido: "sonido_nachos"),
            Producto(nombre: "Chocolate", precio: "$30", imagen: "chocolate", sonido: "sonido_dulce")
        ])
    ]

    var body: some View {
        List(categorias, id: \.nombre) { categoria in
            NavigationLink(destination: ProductosView(categoria: categoria)) {
                Text(categoria.nombre)
                    .font(.headline)
            }
        }
        .navigationTitle("Dulcería")
    }
}

#Preview {
    NavigationStack {
        CategoriasAlimentosView()
    }
}
