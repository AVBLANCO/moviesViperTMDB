//
//  PopupView.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 10/05/24.
//

import SwiftUI


struct PopupView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            Color.white
                .frame(width: 300, height: 400)
                .cornerRadius(20)
                .shadow(radius: 10)
            
            VStack (spacing: 25 ){
                Text("Popup Title")
                    .font(.title)
                    .padding()
                // Imagen PNG
                Image("warning")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                
                // Texto Multilínea
                Text("Multiline Description\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack {
                    ForEach(0..<5) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow) // Color de las estrellas
                    }
                }
                .padding(.vertical, 25)
                .padding(.horizontal, 40)
//                .background(Color.color6)
                .background(Color.color10)
                .cornerRadius(25)
                
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented.toggle() // Activa el estado para mostrar el PopupView
                    }) {
                        Text("Calificar")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(10)
                            .font(Font.custom("Swift-04-Regular", size: 15))
                    }
                    Spacer()
                }
            }
        }
    }
}
