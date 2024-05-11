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
        ZStack {
            Color.white
                .frame(width: 300, height: 400)
                .cornerRadius(20)
                .shadow(radius: 10)
            
            VStack {
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
                .padding()
                
                Spacer()
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            isPresented = false
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                                .font(.title)
                        }
                        .padding(.trailing, 20)
                        .padding(.top, 20)
                    }
                    Spacer()
                }
            }
        }
    }
}
