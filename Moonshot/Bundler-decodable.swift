//
//  Bundler-decodable.swift
//  Moonshot
//
//  Created by Иван Лясковец on 05.08.2023.
//

import Foundation

extension Bundle {
	func decode(_ file: String) -> [String: Astronout] {
		guard let filePath = self.url(forResource: "astronauts", withExtension: "json") else {
			fatalError("Failed to locate \(file) in bundle.")
		}
		
		guard let data = try? Data(contentsOf: filePath) else {
			fatalError("Failed to load data from \(file)")
		}
		
		guard let result = try? JSONDecoder().decode([String: Astronout].self, from: data) else {
			fatalError("Failed to decode data from \(file)")
		}
		
		return result
	}
}
