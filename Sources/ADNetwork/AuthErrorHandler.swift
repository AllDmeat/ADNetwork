//
//  AuthErrorHandler.swift
//
//
//  Created by Алексей Берёзка on 28.02.2021.
//

import Foundation

public protocol AuthErrorHandler: AnyObject {
    func handleExpiredToken()
    func handleInvalidToken()
}
