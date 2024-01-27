//
//  HistoryView.swift
//  DailyDiction2
//
//  Created by Philipp Ley on 12.01.24.
//

// HistoryView.swift
import SwiftUI

struct HistoryView: View {
    @ObservedObject var historyManager = HistoryManager.shared

    var body: some View {
        NavigationView {
            VStack {
                Text("Historie der Wörter")
                    .font(Font.custom("HunckSC-Regular", size: 40))
                    .padding()

                VStack {
                    List {
                        ForEach(historyManager.historyList.reversed(), id: \.word) { entry in
                            VStack(alignment: .leading) {
                                Text(entry.word)
                                    .font(.headline)
                                Text(wordList.first { $0.word == entry.word }?.definition ?? "")
                                    .font(.body)
                                    .foregroundColor(.gray)
                            }
                        }
                        .onDelete { indexSet in
                            // Lösche Einträge aus der Liste
                            historyManager.historyList.remove(atOffsets: indexSet)
                        }
                    }
                    .listStyle(PlainListStyle()) // Verhindert die automatische Trennung der Listenelemente

                    Spacer() // Fügt einen flexiblen Raum hinzu, um die Liste nach unten zu schieben
                }

                Button("Fortschritt zurücksetzen") {
                    // Setze die Historie zurück
                    historyManager.historyList = []
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(10)
                .padding()
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
