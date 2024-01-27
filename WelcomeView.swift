//
//  WelcomeView.swift
//  DailyDiction2
//
//  Created by Philipp Ley on 14.01.24.
//

// WelcomeView.swift

// WelcomeView.swift

import SwiftUI

struct WelcomeView: View {
    @Binding var isFirstLaunch: Bool
    @Binding var userName: String
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        

        
        VStack {
            Spacer()
            Spacer()
            
            
            Text("Willkommen!")
                .font(Font.custom("HunckSC-Regular", size: 50))
            
            Text("Wie lautet dein Name?")
                .font(Font.custom("HunckSC-Regulark", size: 40))
            
            
            
            Spacer()
            
            VStack {
                TextField("Dein Name", text: $userName)
                //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.black)
                    .font(Font.custom("HunckSC-Regular", size: 25))
                
                Button(action: {
                    isFirstLaunch = false
                    UserDefaults.standard.set(userName, forKey: "userName")
                }) {
                    Image("Weiter") // Hier wird das Bild für den Button eingefügt
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .frame(maxWidth: .infinity)
                    
                    
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .preferredColorScheme(.light)
                
                
            }
            .padding()
            .onAppear {
                withAnimation(.easeIn(duration: 3.0)) {
                    self.size = 1.0
                    self.opacity = 1.0
                }
            }
        }
        
    }
}
