//
//  GridLayout.swift
//  Moonshot
//
//  Created by Иван Лясковец on 06.08.2023.
//

import SwiftUI

struct GridLayout: View {
	
	let missions: [Mission]
	let astronauts: [String: Astronout]
	let columns = [GridItem(.adaptive(minimum: 150))]
	
    var body: some View {
		ScrollView {
			LazyVGrid(columns: columns) {
				ForEach(missions) { mission in
					NavigationLink {
						MissionView(mission: mission, astronouts: astronauts)
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
    }
}
