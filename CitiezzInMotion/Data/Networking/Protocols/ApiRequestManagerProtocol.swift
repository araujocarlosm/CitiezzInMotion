//
//  ApiRequestManagerProtocol.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//
import Foundation

protocol ApiRequestManagerProtocol {
  func performRequest(_ url: String) async throws -> Data
}
