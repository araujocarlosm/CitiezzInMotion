//
//  ApiServiceProtocol.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//

protocol ApiServiceProtocol {
  func perform<T: Decodable>(_ url: String) async throws -> T
}
