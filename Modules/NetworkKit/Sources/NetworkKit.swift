//
//  NetworkKit.swift
//

import Foundation
import Moya

public final class CustomProvider<T: TargetType>: MoyaProvider<T> {
    
    public init(timeout: TimeInterval = 10) {
        
        let commonRequest = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
            do {
                var request = try endpoint.urlRequest()
                
                request.timeoutInterval = timeout
                done(.success(request))
            } catch {
                done(.failure(.underlying(error, nil)))
            }
        }
        
        super.init(
            requestClosure: commonRequest,
            plugins: []
        )
    }
    
    public func requestMethod<M: Codable>(_ target: T) async throws -> M {
        let response = try await withCheckedThrowingContinuation { continuation in
            request(target) { result in
                continuation.resume(with: result)
            }
        }
        return try response.map(M.self)
    }
}
