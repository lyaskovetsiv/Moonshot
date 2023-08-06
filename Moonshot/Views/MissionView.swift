//
//  MissionView.swift
//  Moonshot
//
//  Created by Иван Лясковец on 05.08.2023.
//

import SwiftUI

struct MissionView: View {
	
	let mission: Mission
	let crew: [CrewMember]
	
	var body: some View {
		GeometryReader { geo in
			ScrollView {
				VStack {
					Image(mission.image)
						.resizable()
						.scaledToFit()
						.frame(maxWidth: geo.size.width * 0.6)
						.padding(.top)
					
					Text("Date: \(mission.formattedLaunchDate)")
						.fontWeight(.bold)
						.padding(.top)
						.font(.headline)
					
					VStack (alignment: .leading) {
						Rectangle()
							.frame(height: 2)
							.foregroundColor(.lightBackgroundColor)
							.padding(.vertical)
						Text("Mission Highlights")
							.font(.title.bold())
							.foregroundColor(.white)
							.padding(.bottom, 5)
						Text(mission.description)
							.foregroundColor(.white)
						Rectangle()
							.frame(height: 2)
							.foregroundColor(.lightBackgroundColor)
							.padding(.vertical)
						
						Text("Crew")
							.font(.title.bold())
							.foregroundColor(.white)
							.padding(.bottom, 5)
					}
					.padding(.horizontal)
					
					ScrollView(.horizontal, showsIndicators: false) {
						CrewView(mission: mission, crew: crew)
					}
				}
				.padding(.bottom)
			}
		}
		.navigationTitle(mission.displayName)
		.navigationBarTitleDisplayMode(.inline)
		.background(.darkBackgroundColor)
	}
	
	init(mission: Mission, astronouts: [String: Astronout]) {
		self.mission = mission
		self.crew = mission.crew.map({ member in
			if let astronaut = astronouts[member.name] {
				return CrewMember(role: member.role,
								  astronout: astronaut)
			} else {
				fatalError("Missing \(member.name)")
			}
		})
	}
}

struct MissionView_Previews: PreviewProvider {
	static let missions: [Mission] = Bundle.main.decode("missions.json")
	static let astronouts: [String: Astronout] = Bundle.main.decode("astronauts.json")
	
    static var previews: some View {
        MissionView(mission: missions[0], astronouts: astronouts)
			.preferredColorScheme(.dark)
    }
}
