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
    @State private var isRatingModalPresented = false
    
    var body: some View {
        ScrollView {
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
                            .font(Font.custom("Swift-04-Regular", size: 15))
                    }
                    .padding()
                    .foregroundColor(Color.color5)
                    .background(Color.color1)
                    .cornerRadius(10)
                }
                
                Button(action: {
                    // Acción del botón
                }) {
                    HStack(spacing: 15) {
                        Image(systemName: "pencil")
                            .foregroundColor(.white)
                        Text("Button pencil Icon")
                            .font(Font.custom("Info Story", size: 15))
                    }
                    .padding()
                    .foregroundColor(Color.color8)
                    .background(Color.color1)
                    .cornerRadius(15)
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
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            isModalPresented.toggle()
                        }) {
                            Text("Register")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        
                        Spacer()
                    }
                }
                
                Spacer()
                
                HStack {
                    // Button 1
                    Button(action:{
                        
                    } ) {
                        Image(systemName: "start")
                            .modifier(buttonCircule(color: Color.color2))
                    }
                    // Button 2
                    Button(action:{
                        
                    } ) {
                        Image(systemName: "pencil")
                            .modifier(buttonCircule(color: Color.color9))
                    }
                }
            }
            .padding()
            .sheet(isPresented: $isModalPresented) {
                ModalView()
            }
            Spacer()
            HStack {
                CellView()
            }
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    isRatingModalPresented.toggle()
                }) {
                    Text("Calificar ")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10)
                        .font(Font.custom("Swift-04-Regular", size: 15))
                }
                Spacer()
            } .sheet(isPresented: $isRatingModalPresented) {
                PopupView(isPresented: $isRatingModalPresented)
            }
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

struct buttonCircule: ViewModifier {
    var color: Color

    func body(content: Content) -> some View {
        content
            .padding(20)
            .background(color)
            .clipShape(Circle())
            .foregroundColor(Color.color10)
            .font(Font.custom("Salium", size: 15))
    }
}

//struct VisualComponentView_Previews: PreviewProvider {
//    static var previews: some View {
//        VisualComponentView()
//    }
//}
