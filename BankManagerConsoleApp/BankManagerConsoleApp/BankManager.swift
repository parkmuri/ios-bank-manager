//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    var bank = Bank()
    
    mutating func openBank() {
        bank.lineUpClient()
        bank.serviceToClient()
    }
}
