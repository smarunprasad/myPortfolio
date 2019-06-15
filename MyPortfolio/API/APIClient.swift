//
//  APIClient.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 15/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

final class APIClient {
    
    static let shared = APIClient()
    private let session = URLSession.shared
    
    func dataRequest<M: Codable>(router: APIRouter, completionBlock: @escaping (_ success: Bool, _ result: Result<M,HDError>) -> Void) -> URLSessionDataTask {
        
        let dataTask = session.dataTask(with: router.asUrlRequest()) { (data, respose, error) in
            
            guard let data = data else {
                completionBlock (false, Result.failure(HDError.clientSideError))
            }
            
            do {
                
                let json = try JSONDecoder().decode(M.self, from: data)
                completionBlock (true, Result.success(json))
            }
            catch {
                
                completionBlock (false, Result.failure(HDError.serverSideError))
            }
        }
        dataTask.resume()
        return dataTask
    }
}
