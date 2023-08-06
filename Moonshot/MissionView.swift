//
//  MissionView.swift
//  Moonshot
//
//  Created by Иван Лясковец on 05.08.2023.
//

import SwiftUI

struct MissionView: View {
	
	struct CrewMember {
		let role: String
		let astronout: Astronout
	}
	
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
					
					
					VStack (alignment: .leading) {
						Rectangle()
							.frame(width: .infinity, height: 2)
							.foregroundColor(.lightBackgroundColor)
							.padding(.vertical)
						Text("Mission Highlights")
							.font(.title.bold())
							.foregroundColor(.white)
							.padding(.bottom, 5)
						Text(mission.description)
							.foregroundColor(.white)
						Rectangle()
							.frame(width: .infinity, height: 2)
							.foregroundColor(.lightBackgroundColor)
							.padding(.vertical)
						
						Text("Crew")
							.font(.title.bold())
							.foregroundColor(.white)
							.padding(.bottom, 5)
					}
					.padding(.horizontal)
					
					ScrollView(.horizontal, showsIndicators: false) {
						HStack {
							ForEach(crew, id: \.role) { crewMember in
								NavigationLink {
									Text("Astronaut details")
								} label: {
									HStack {
										Image(crewMember.astronout.id)
											.resizable()
											.frame(width: 102, height: 74)
											.clipShape(Capsule())
											.overlay {
												Capsule()
													.strokeBorder(.white, lineWidth: 1)
											}
										
										VStack(alignment: .leading) {
											Text(crewMember.astronout.name)
												.foregroundColor(.white)
												.font(.headline)
											Text(crewMember.role)
												.foregroundColor(.secondary)
											
										}
									}
									.padding(.horizontal)
								}
							}
						}
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
