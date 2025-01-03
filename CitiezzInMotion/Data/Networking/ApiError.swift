//
//  ApiError.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//


enum ApiError: Error {
  case invalidURL
  case requestFailed(Error)
  case invalidResponse
  case decodingError(Error)
}