//
//  ContentView.swift
//  Moonshot
//
//  Created by Иван Лясковец on 05.08.2023.
//

import SwiftUI

struct ContentView: View {
	
	let astronouts: [String: Astronout] = Bundle.main.decode("astronauts.json")
	let missions: [Mission] = Bundle.main.decode("missions.json")
	
	@State private var showingGrid = false
	
	var body: some View {
		NavigationView {
			Group {
				if showingGrid {
					GridLayout(missions: missions, astronauts: astronouts)
				} else {
					ListLayout(missions: missions, astronauts: astronouts)
				}
			}
			.navigationTitle("Moonshot")
			.background(.darkBackgroundColor)
			.preferredColorScheme(.dark)
			.toolbar {
				ToolbarItem {
					Button {
						showingGrid.toggle()
					} label: {
						Text("Change UI")
					}
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
