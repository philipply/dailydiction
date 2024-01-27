//
//  WordModel.swift
//  DailyDiction2
//
//  Created by Philipp Ley on 12.01.24.
//

import Foundation

struct Word {
    var word: String
    var definition: String
    var example: String
}

struct Theme {
    var name: String
    var words: [Word]
}

let wordList: [Word] = themes.flatMap { $0.words }
let themes: [Theme] = [
    Theme(name: "Wirtschaft und Recht", words: [
        Word(word: "Liquidation", definition: "Die Auflösung eines Unternehmens und die Verwertung seiner Vermögenswerte.", example: "Die Liquidation des Unternehmens erfolgte aufgrund finanzieller Schwierigkeiten."),
        Word(word: "Rendite", definition: "Das Verhältnis zwischen Gewinn und Investition, oft in Prozent ausgedrückt.", example: "Die Rendite der Anleihe beträgt 5%."),
        Word(word: "Klage", definition: "Ein formeller Rechtsanspruch, der vor Gericht geltend gemacht wird.", example: "Der Anwalt reichte eine Klage gegen das Unternehmen ein."),
        // ... Weitere Wörter für dieses Thema
    ]),
    Theme(name: "Gesundheit und Medizin", words: [
        Word(word: "Therapie", definition: "Die Behandlung von Krankheiten oder Beschwerden durch medizinische Maßnahmen.", example: "Die Physiotherapie half bei der Genesung."),
        Word(word: "Diagnose", definition: "Die Identifizierung von Krankheiten durch Untersuchung der Symptome.", example: "Die schnelle Diagnose ermöglichte eine effektive Behandlung."),
        Word(word: "Operation", definition: "Ein chirurgischer Eingriff zur Behandlung von Krankheiten oder Verletzungen.", example: "Die Operation verlief erfolgreich."),
        // ... Weitere Wörter für dieses Thema
    ]),
    Theme(name: "Technologie und Informatik", words: [
        Word(word: "Algorithmus", definition: "Eine präzise Anweisungsserie zur Lösung eines bestimmten Problems.", example: "Der Algorithmus sortiert die Daten in aufsteigender Reihenfolge."),
        Word(word: "Interface", definition: "Die Schnittstelle, die die Interaktion zwischen verschiedenen Softwarekomponenten ermöglicht.", example: "Das Benutzerinterface ist benutzerfreundlich gestaltet."),
        Word(word: "Software", definition: "Programme und Anwendungen, die auf Computern ausgeführt werden können.", example: "Die neue Software verbessert die Effizienz."),
        // ... Weitere Wörter für dieses Thema
    ]),
    Theme(name: "Kunst und Kultur", words: [
        Word(word: "Atelier", definition: "Der Arbeitsplatz eines Künstlers, insbesondere in Bezug auf Malerei oder Bildhauerei.", example: "Der Künstler arbeitete in seinem Atelier an einem neuen Gemälde."),
        Word(word: "Dadaismus", definition: "Eine künstlerische Bewegung, die sich durch Absurdität und Nihilismus auszeichnet.", example: "Der Dadaismus hinterfragt traditionelle künstlerische Konventionen."),
        Word(word: "Performance", definition: "Eine künstlerische Darbietung, oft live vor Publikum.", example: "Die Performancekünstlerin begeisterte das Publikum."),
        // ... Weitere Wörter für dieses Thema
    ]),
    Theme(name: "Gastronomie und Mode", words: [
        Word(word: "Delikatesse", definition: "Ein hochwertiges und exquisites Lebensmittel.", example: "Die Delikatesse ist ein Genuss für Feinschmecker."),
        Word(word: "Gourmet", definition: "Ein Feinschmecker, jemand, der besonders anspruchsvoll in Bezug auf Essen ist.", example: "Der Gourmet genoss die exquisiten Speisen des Sternekochs."),
        Word(word: "Couturier", definition: "Ein Modedesigner, der maßgeschneiderte Kleidung entwirft.", example: "Der Couturier präsentiert seine neueste Kollektion."),
        // ... Weitere Wörter für dieses Thema
    ]),
    Theme(name: "Wissenschaft und Philosophie", words: [
        Word(word: "Element", definition: "Eine grundlegende Substanz, die nicht weiter in andere Substanzen zerlegt werden kann.", example: "Wasser ist ein chemisches Element."),
        Word(word: "Dialektik", definition: "Die Kunst der Diskussion und des Argumentierens, insbesondere in der Philosophie.", example: "Die Dialektik untersucht die Wechselwirkungen von Gegensätzen."),
        Word(word: "Ethik", definition: "Die moralischen Prinzipien, die das Verhalten einer Person oder Gemeinschaft leiten.", example: "Die Ethik spielt eine zentrale Rolle in der Medizin."),
        // ... Weitere Wörter für dieses Thema
    ]),
]
