//
//  CrewView.swift
//  Moonshot
//
//  Created by Иван Лясковец on 06.08.2023.
//

import SwiftUI

struct CrewView: View {
	
	let mission: Mission
	let crew: [CrewMember]
	
    var body: some View {
		HStack {
			ForEach(crew, id: \.role) { crewMember in
				NavigationLink {
					AstronautView(astronaut: crewMember.astronaut)
				} label: {
					HStack {
						Image(crewMember.astronaut.id)
							.resizable()
							.frame(width: 102, height: 74)
							.clipShape(Capsule())
							.overlay {
								Capsule()
									.strokeBorder(.white, lineWidth: 1)
							}
						
						VStack(alignment: .leading) {
							Text(crewMember.astronaut.name)
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
