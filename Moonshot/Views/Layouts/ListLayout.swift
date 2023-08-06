//
//  ListLayout.swift
//  Moonshot
//
//  Created by Иван Лясковец on 06.08.2023.
//

import SwiftUI

struct ListLayout: View {
	
	let missions: [Mission]
	let astronauts: [String: Astronaut]
	
    var body: some View {
		List {
			ForEach(missions) { mission in
				NavigationLink {
					MissionView(mission: mission, astronauts: astronauts)
				} label: {
					HStack {
						Image(mission.image)
							.resizable()
							.scaledToFit()
							.frame(width: 80, height: 80)
							.padding(.trailing)
						VStack (alignment: .leading) {
							Text(mission.displayName)
								.font(.title2)
								.foregroundColor(.white)
							Text(mission.formattedLaunchDate)
								.font(.headline)
								.foregroundColor(.white.opacity(0.5))
						}
					}
				}
				.listRowBackground(Color.darkBackgroundColor)
			}
		}
		.listStyle(.plain)
    }
}
