//
//  DailyWordView.swift
//  DailyDiction2
//
//  Created by Philipp Ley on 12.01.24.
//

import SwiftUI

struct DailyWordView: View {
    @Binding var currentIndex: Int
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Spacer()

            Text("Heutiges Wort:")
                .font(Font.custom("HunckSC-Regular", size: 40))
                .lineLimit(nil)
                .padding()

            VStack(alignment: .center, spacing: -10) {
                if let currentWord = appState.wordList[safe: appState.currentIndex] {
                    Text(currentWord.word)
                        .font(Font.custom("HunckSC-Regular", size: 30))
                        .padding()

                    Text(currentWord.definition)
                        .font(.body)
                        .padding()
                }
            }
            .padding(1)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black, lineWidth: 3)
            )
            .padding(15)

            Spacer()
            Spacer()

            Button("das Wort kenne ich schon!", action: {
                appState.showNextWord()

                if let currentWord = appState.wordList[safe: appState.currentIndex] {
                    appState.addToHistoryIfNeeded(word: currentWord.word)
                }
            })
            .padding(10)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .onAppear {
            if let currentWord = appState.wordList[safe: appState.currentIndex] {
                appState.addToHistoryIfNeeded(word: currentWord.word)
            }
        }
    }
}

struct DailyWordView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWordView(currentIndex: .constant(0))
            .environmentObject(AppState())
    }
}
extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
