//
//  ApiService.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//
import Foundation

class ApiService : ApiServiceProtocol {
  private let apiRequestManager: ApiRequestManagerProtocol
  
  init(apiRequestManager: ApiRequestManagerProtocol) {
    self.apiRequestManager = apiRequestManager
  }
  
  func perform<T: Decodable>(_ url: String) async throws -> T {
    let data = try await apiRequestManager.performRequest(url)
    return try JSONDecoder().decode(T.self, from: data)
  }
}
