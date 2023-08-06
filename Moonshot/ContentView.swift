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
							MissionView(mission: mission, astronouts: astronouts)
						} label: {
							VStack {
								Image(mission.image)
									.resizable()
									.scaledToFit()
									.frame(width: 100, height: 100)
									.padding()
								VStack {
									Text(mission.displayName)
										.font(.headline)
										.foregroundColor(.white)
									Text(mission.formattedLaunchDate)
										.font(.caption)
										.foregroundColor(.white.opacity(0.5))
								}
								.padding(.vertical)
								.frame(maxWidth: .infinity)
								.background(.lightBackgroundColor)
							}
							.clipShape(RoundedRectangle(cornerRadius: 10))
							.overlay {
								RoundedRectangle(cornerRadius: 10)
									.stroke(.lightBackgroundColor)
							}
						}
					}
				}
				.padding([.horizontal, .bottom])
			}
			.navigationTitle("Moonshot")
			.background(.darkBackgroundColor)
			.preferredColorScheme(.dark)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
