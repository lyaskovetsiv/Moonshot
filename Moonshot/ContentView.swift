//
//  ContentView.swift
//  Moonshot
//
//  Created by Иван Лясковец on 05.08.2023.
//

import SwiftUI

struct ContentView: View {
	
	let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
	let missions: [Mission] = Bundle.main.decode("missions.json")
	
	@State private var showingGrid = true
	
	var body: some View {
		NavigationView {
			Group {
				if showingGrid {
					GridLayout(missions: missions, astronauts: astronauts)
				} else {
					ListLayout(missions: missions, astronauts: astronauts)
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
