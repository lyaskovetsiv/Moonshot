//
//  Bundler-decodable.swift
//  Moonshot
//
//  Created by Иван Лясковец on 05.08.2023.
//

import Foundation

extension Bundle {
	func decode<T: Codable>(_ file: String) -> T {
		guard let url = self.url(forResource: file, withExtension: nil) else {
			fatalError("Failed to locate \(file) in bundle.")
		}
		
		guard let data = try? Data(contentsOf: url) else {
			fatalError("Failed to load data from \(file)")
		}
		
		let decoder = JSONDecoder()
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "y-MM-dd"
		decoder.dateDecodingStrategy = .formatted(dateFormatter)
		
		guard let result = try? decoder.decode(T.self, from: data) else {
			fatalError("Failed to decode data from \(file)")
		}
		
		return result
	}
}
