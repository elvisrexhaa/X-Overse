//
//  AppButton.swift
//  X&Overse
//
//  Created by Elvis Rexha on 08/01/2025.
//

import SwiftUI

struct AppButton: View {
    var imageName: String = "person.fill"
    var title: String = "Play Solo"
    var isButtonPressed: () -> ()
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color(.systemGray))
                .offset(y: 4)
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.white)
            
            Button {
                isButtonPressed()
            } label: {
                HStack {
                    Image(systemName: imageName)
                        .imageScale(.large)
                        .foregroundStyle(.bg)
                    
                    Spacer(minLength: 0)
                    Text(title)
                        .foregroundStyle(.bg)
                        .fontWeight(.semibold)
                        .font(.headline)
                    
                    Spacer(minLength: 0)
                }
                .padding()
            }
            
            
        }
        .frame(height: 60)
        .padding(.horizontal, 40)
        .activeButtonModifier()
       
    }
}

#Preview {
    ZStack {
        AppBackground()
        AppButton {
            
        }
    }
}
