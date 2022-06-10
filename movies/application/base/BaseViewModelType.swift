//
//  BaseViewModelType.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/10.
//

protocol BaseViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
