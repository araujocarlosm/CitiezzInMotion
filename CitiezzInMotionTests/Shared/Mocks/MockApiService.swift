//
//  MockApiService.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//
import Foundation
@testable import CitiezzInMotion

class MockApiService : ApiServiceProtocol {
  var mockedResponse: Any? = nil
  
  func perform<T: Decodable>(_ url: String) async throws -> T {
    guard let response = mockedResponse as? T else {
      throw ApiError.invalidResponse
    }
    return response
  }
}
