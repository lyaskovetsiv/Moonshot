//
//  MissionView.swift
//  Moonshot
//
//  Created by Иван Лясковец on 05.08.2023.
//

import SwiftUI

struct MissionView: View {
	
	let mission: Mission
	
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
						Text("Mission Highlights")
							.font(.title.bold())
							.foregroundColor(.white)
							.padding(.bottom, 5)
						Text(mission.description)
							.foregroundColor(.white)
					}
					.padding(.horizontal)
				}
				.padding(.bottom)
			}
		}
		.navigationTitle(mission.displayName)
		.navigationBarTitleDisplayMode(.inline)
		.background(.darkBackgroundColor)
	}
}

struct MissionView_Previews: PreviewProvider {
	static let missions: [Mission] = Bundle.main.decode("missions.json")
	
    static var previews: some View {
        MissionView(mission: missions[0])
			.preferredColorScheme(.dark)
    }
}
