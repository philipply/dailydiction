//
//  ContentView.swift
//  DailyDiction2
//
//  Created by Philipp Ley on 12.01.24.
//

// ContentView.swift

import SwiftUI

struct ContentView: View {
    @ObservedObject private var appState = AppState()
    @State private var isMenuVisible = false
    @State private var showWelcomeView = false
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        NavigationView {
            VStack {
                
                Image("Logo")
                                  .resizable()
                                  .aspectRatio(contentMode: .fit)
                                  .frame(maxWidth: 300, maxHeight: 80)
                                  .padding(.top, 20)
                
                
               
                Spacer()
                
                Text("Hey \(appState.userName) 👋🏻")
                    .font(.largeTitle)
                    .padding()
                
                Text("du hast bisher \(appState.learnedWordsCount) Wörter gelernt!")
                    .font(.headline)
                    .padding()
                    .onAppear {
                        appState.learnedWordsCount = HistoryManager.shared.historyList.count
                    }
                    .padding(.top, -25)
                
                Spacer()
                
                VStack{
                    NavigationLink(destination: DailyWordView(currentIndex: $appState.currentIndex)
                        .environmentObject(appState)) {
                        Image("MeinHeutigesWort")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 280, maxHeight: 80)
                    }
                    
                    NavigationLink(destination: HistoryView()) {
                        Image("MeineHistorie")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 280, maxHeight: 80)
                    }
                    
                    Button(action: {
                        isMenuVisible.toggle()
                    }) {
                        Image("Themenfelder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 280, maxHeight: 80)
                    }
                    
                    NavigationLink(destination: MenuView()
                        .environmentObject(appState),
                                   isActive: $isMenuVisible) {
                        EmptyView()
                    }
                    .hidden()
                }
                .padding()
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 0.4)) {
                        self.size = 1.0
                        self.opacity = 1.0
                        
                        Spacer()
                    }
                }
                .environmentObject(appState)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
