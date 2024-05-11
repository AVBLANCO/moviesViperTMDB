//
//  CellView.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 10/05/24.
//

import SwiftUI

struct CellView: View {
    var body: some View {
        HStack {
            Text("SC")
                .padding(20)
                .background(Color.color5)
                .clipShape(Circle())
                .foregroundColor(Color.color10)
//                .font("Infor Story")
                .font(Font.custom("Salium", size: 20))
            VStack (alignment: .leading) {
                Text("Daniel Manjarrez")
                    .font(.title)
                    .bold()
                
                Text("Stori Producto")
                    .font(.headline)
                
            }
        }
    }
}

struct CellView_previes: PreviewProvider {
    static var previews: some View {
        CellView()
    }
}
