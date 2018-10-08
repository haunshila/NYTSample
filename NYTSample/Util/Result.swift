//
//  Result.swift
//  NYTSample
//
//  Created by hauyadav on 08/10/18.
//  Copyright © 2018 mycompany. All rights reserved.
//

enum Result<T, U: Error> {
    case success(payload: T)
    case failure(U?)
}

enum EmptyResult<U: Error> {
    case success
    case failure(U?)
}
