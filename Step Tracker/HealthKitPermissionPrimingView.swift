//
//  HealthKitPermissionPrimingView.swift
//  Step Tracker
//
//  Created by Guilherme Golfetto on 19/06/24.
//

import SwiftUI

struct HealthKitPermissionPrimingView: View {
    
    var description = """
    Esse Aplication mostra a quantidade de passos e seu peso com graficos interativos
    
    Você pode também adicionar manualmente uma nova contagem de passos e peso diretamente para o App Saúde através desse app.
    
    Seus dados são privados e seguros comigo. Confia.
    """
    
    var body: some View {
        VStack(spacing: 100) {
            
            VStack(alignment: .leading, spacing: 10) {
                Image(.appleHealth)
                    .resizable()
                    .frame(width: 90, height: 90)
                    .shadow(color: .gray.opacity(0.3), radius: 16)
                    .padding(.bottom, 12)
                
                Text("Integração com App Saúde")
                    .font(.title2).bold()
                
                Text(description)
                    .foregroundStyle(.secondary)
            }
            
            Button("Conectar com Saúde") {
                //venho aqui depois
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
        }
        .padding(30)
    }
}

#Preview {
    HealthKitPermissionPrimingView()
}
