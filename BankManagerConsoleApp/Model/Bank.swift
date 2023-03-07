//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 리지, 무리 on 2023/03/07.
//

struct Bank {
    var bankManager: BankManager
    var clientList: Queue<Int>
  
    mutating func lineUpClient() {
        let client = Client()

        for number in 1...client.number {
            clientList.enqueue(number)
        }
    }
    
    mutating func allocateClient(to bankManager: BankManager) {
        
    }
}
