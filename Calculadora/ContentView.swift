//
//  ContentView.swift
//  Calculadora
//
//  Created by Marco on 27/3/24.
//

import SwiftUI

class MiClase : ObservableObject {
    @Published var nombre = "Marco"
    @Published var edad = 53
}

struct ContentView: View {
    @State private var valor = 0
    @State private var seleccion:Int?
    @StateObject private var miObjeto = MiClase()
    
    var body: some View {
        NavigationView{
        VStack{
            Text("El valor es: \(valor)")
            Button("Suma 1"){
                valor += 1
                
            }
            Text("Mi nombre es \(miObjeto.nombre) y mi edad es \(miObjeto.edad)")
            Button("Modificar Objeto"){
            miObjeto.nombre = "Marco Tapia"
            miObjeto.edad += 1
           
            }
            
            NavigationLink(destination: BindingView(valor: $valor,miObjeto:miObjeto), tag: 1, selection: $seleccion){
                Button("Ir a orta vista"){
                    seleccion = 1
                }
            }
        }.navigationTitle("Mi calculadora")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
