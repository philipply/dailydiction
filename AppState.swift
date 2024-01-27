//
//  AppState.swift
//  DailyDiction2
//
//  Created by Philipp Ley on 12.01.24.

// AppState.swift

import SwiftUI

class AppState: ObservableObject {
    @Published var currentIndex: Int
    @Published var learnedWordsCount: Int
    @Published var selectedThemes: Set<String> {
        didSet {
            saveSelectedThemes()
        }
    }
    @Published var userName: String

    var wordList: [Word] {
        if selectedThemes.isEmpty {
            return themes.flatMap { $0.words }
        } else {
            return themes.filter { selectedThemes.contains($0.name) }
                          .flatMap { $0.words }
        }
    }

    init() {
        self.currentIndex = UserDefaults.standard.integer(forKey: "currentIndex")
        self.learnedWordsCount = HistoryManager.shared.historyList.count
        self.selectedThemes = Set(UserDefaults.standard.stringArray(forKey: "selectedThemes") ?? [])
        self.userName = UserDefaults.standard.string(forKey: "userName") ?? ""
        checkNewDay()
    }

    func checkNewDay() {
        let currentDate = Date()

        if let lastUpdatedDate = UserDefaults.standard.value(forKey: "lastUpdatedDate") as? Date,
           !Calendar.current.isDateInToday(lastUpdatedDate) {
            UserDefaults.standard.set(currentDate, forKey: "lastUpdatedDate")
            showNextWord()

            if let word = themes.flatMap({ $0.words })
                .first(where: { $0.word == themes.flatMap({ $0.words })[currentIndex].word }) {
                addToHistoryIfNeeded(word: word.word)
                learnedWordsCount = HistoryManager.shared.historyList.count
            }
        }
    }

    func showNextWord() {
        let availableWords = wordList

        guard !availableWords.isEmpty else {
            return
        }

        currentIndex = Int.random(in: 0..<availableWords.count)

        UserDefaults.standard.set(currentIndex, forKey: "currentIndex")
    }

    func addToHistoryIfNeeded(word: String) {
        if !HistoryManager.shared.historyList.contains(where: { $0.word == word }) {
            let newEntry = HistoryEntry(word: word, date: Date())
            HistoryManager.shared.addToHistory(newEntry)
        }
    }

    func saveSelectedThemes() {
        UserDefaults.standard.set(Array(selectedThemes), forKey: "selectedThemes")
    }

    func saveUserName() {
        UserDefaults.standard.set(userName, forKey: "userName")
    }
}
