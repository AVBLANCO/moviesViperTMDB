//
//  PopupView.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 10/05/24.
//

import SwiftUI


struct PopupView: View {
    var body: some View {
        ZStack {
            Color.white
                .frame(width: 300, height: 400)
                .cornerRadius(20)
                .shadow(radius: 10)
            
            VStack {
                Image(systemName: "warning")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                
                Text("Title")
                    .font(.title)
                
                Text("Multiline Description\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                Button("Close") {
                    // Cerrar ventana emergente
                }
                .padding()
            }
            .padding()
        }
    }
}
