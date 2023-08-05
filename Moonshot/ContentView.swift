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
	
	let columns = [
		GridItem(.adaptive(minimum: 150))
	]
	
    var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid(columns: columns) {
					ForEach(missions) { mission in
						NavigationLink {
							Text("Detail view")
						} label: {
							VStack {
								Image(mission.image)
									.resizable()
									.scaledToFit()
									.frame(width: 100, height: 100)
								VStack {
									Text(mission.displayName)
										.font(.headline)
									Text(mission.launchDate ?? "N/A")
										.font(.caption)
								}
								.frame(maxWidth: .infinity)
							}
						}
					}
				}
			}
			.navigationTitle("Moonshot")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
