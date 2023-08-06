//
//  AstronautView.swift
//  Moonshot
//
//  Created by Иван Лясковец on 06.08.2023.
//

import SwiftUI

struct AstronautView: View {
	
	let astronaut: Astronout
	
    var body: some View {
		ScrollView {
			VStack {
				Image(astronaut.id)
					.resizable()
					.scaledToFit()
				
				Text(astronaut.description)
					.padding()
					.foregroundColor(.white)
			}
		}
		.background(.darkBackgroundColor)
		.navigationTitle(astronaut.name)
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
	static let astronauts: [String: Astronout] = Bundle.main.decode("astronauts.json")
	
    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
    }
}
