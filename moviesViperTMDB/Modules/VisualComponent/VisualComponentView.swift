//
//  VisualComponentView.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 10/05/24.
//

import SwiftUI

struct VisualComponentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isModalPresented = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Botón con borde circular
            Button(action: {
            }) {
                Text("Circular Button")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(20)
            }
            
            // Botón subrayado
            Button(action: {
            }) {
                Text("Underlined Button")
                    .padding(.vertical, 10)
                    .foregroundColor(.blue)
                    .underline()
            }
            
            // Botón con icono
            Button(action: {
                // Acción del botón
            }) {
                HStack {
                    Image(systemName: "person.fill")
                    Text("Button with Icon")
                }
                .padding()
                .foregroundColor(Color.color5)
                .background(Color.color1)
                .cornerRadius(10)
            } 
            
            Button(action: {
                // Acción del botón
            }) {
                HStack {
                    Image(systemName: "pencil")
                    .foregroundColor(.color3)
                    Text("Button pencil Icon")
                }
                .padding()
                .foregroundColor(Color.color8)
                .background(Color.color1)
                .cornerRadius(10)
            }
            
            // Formulario de registro
            VStack(alignment: .leading, spacing: 20) {
                Text("Username:")
                TextField("Enter your username", text: $username)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                Text("Password:")
                SecureField("Enter your password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                Button(action: {
                    isModalPresented.toggle()
                }) {
                    Text("Register")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $isModalPresented) {
            ModalView()
        }
    }
}

struct ModalView: View {
    var body: some View {
        VStack {
            Text("Modal Content")
            Spacer()
            Button("Close") {
                // Cerrar modal
            }
            .padding()
        }
        .padding()
        .background(Color.white)
    }
}

//struct VisualComponentView_Previews: PreviewProvider {
//    static var previews: some View {
//        VisualComponentView()
//    }
//}
