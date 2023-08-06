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
					AstronautView(astronaut: crewMember.astronout)
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
