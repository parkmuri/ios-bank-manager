//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 리지, 무리 on 2023/03/07.
//

struct Client {
    var clientList: Queue<Int>
    
    mutating func lineUpClient() {
        let numberOfClient: Int = Int.random(in: 10...30)
        
        for number in 1...numberOfClient {
            clientList.enqueue(number)
        }
    }
}
