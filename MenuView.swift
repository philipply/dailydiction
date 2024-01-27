//
//  MenuView.swift
//  DailyDiction2
//
//  Created by Philipp Ley on 14.01.24.
// MenuView.swift

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            ForEach(themes, id: \.name) { theme in
                Toggle(isOn: Binding(
                    get: { appState.selectedThemes.contains(theme.name) },
                    set: { newValue in
                        if newValue {
                            appState.selectedThemes.insert(theme.name)
                        } else {
                            appState.selectedThemes.remove(theme.name)
                        }
                        UserDefaults.standard.set(Array(appState.selectedThemes), forKey: "selectedThemes")
                    }
                )) {
                    Text(theme.name)
                        .font(.headline)
                        .padding()
                }
            }
        }
        .padding()
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
