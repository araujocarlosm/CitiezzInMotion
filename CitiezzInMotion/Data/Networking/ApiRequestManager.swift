//
//  ApiRequestManager.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//
import Foundation

class ApiRequestManager: ApiRequestManagerProtocol {
  private let urlSession: URLSession
  
  init(urlSession: URLSession = URLSession.shared) {
    self.urlSession = urlSession
  }
  
  func performRequest(_ url: String) async throws -> Data {
    guard let url = URL(string: url) else {
      throw ApiError.invalidURL
    }
    
    let request = URLRequest(url: url)
    let (data, response) = try await urlSession.data(for: request)
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
      throw ApiError.invalidResponse
    }
    
    return data
  }
}
