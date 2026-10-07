//
//  ContentView.swift
//  Navegacion
//
//  Created by Ana Sofia Soqui on 14/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ListMovieView()
                .navigationTitle("Cartelera")
        }
    }
}

#Preview {
    ContentView()
}
