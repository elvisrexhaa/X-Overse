//
//  ContentView.swift
//  X&Overse
//
//  Created by Elvis Rexha on 08/01/2025.
//

import SwiftUI

struct IntroductionView: View {
    @State private var showAboutPage: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                AppBackground()
                VStack(spacing: 24) {
                    Spacer(minLength: 0)
                    Text("X&Overse")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .fontDesign(.monospaced)
                       
                    Spacer(minLength: 0)
                    
                    AppButton(
                        imageName: "person.fill",
                        title: "Play Solo") {
                            // play solo start game here...
                        }
                    
                    AppButton(
                        imageName: "person.2.fill",
                        title: "Play with a friend") {
                            // play solo start game here...
                        }
                    
                    Button {
                        // go to about screen
                        showAboutPage.toggle()
                    } label: {
                        Text("About")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.bg.opacity(0.8).shadow(.drop(radius: 20)))
                    }
                    .padding(.horizontal, 40)
                    
                    Spacer(minLength: 0)
                    
                    
                }
            }
            .sheet(isPresented: $showAboutPage) {
                Text("About the game page")
            }
            
        }
    }
}

#Preview {
    IntroductionView()
}

struct AppBackground: View {
    var body: some View {
        Color.bg.ignoresSafeArea()
    }
}

#Preview {
    AppBackground()
}

struct ActiveButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.87 : 1)
            .animation(.smooth, value: configuration.isPressed)
    }
}

#Preview {
    Button(action: { print("Pressed") }) {
        Label("Press Me", systemImage: "star")
    }
    .buttonStyle(ActiveButtonStyle())
}


extension View {
    @ViewBuilder func activeButtonModifier() -> some View {
        self
            .buttonStyle(ActiveButtonStyle())
    }
}

