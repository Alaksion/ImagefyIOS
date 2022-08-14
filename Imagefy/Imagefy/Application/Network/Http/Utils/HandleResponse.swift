//
//  HandleResponse.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 14/08/22.
//

import Foundation

func handleResponse<R, D>(
    result: Result<R, RequestError>,
    mapper: (R) -> D
) -> Result<D, RequestError> {
    switch result {
    case.success(let data):
        return .success(mapper(data))
    case .failure(let error):
        return .failure(error)
    }
}

