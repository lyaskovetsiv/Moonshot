//
//  ContentView.swift
//  Moonshot
//
//  Created by Иван Лясковец on 05.08.2023.
//

import SwiftUI

struct ContentView: View {
	
	let astronouts: [String: Astronout] = Bundle.main.decode("astronouts.json")
    var body: some View {
        VStack {
			Text("\(astronouts.count)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
