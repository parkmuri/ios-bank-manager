//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 리지, 무리 on 2023/03/07.
//

import Foundation

struct BankClerk {
    mutating func service(to client: Client) {
        let start = "\(client.number)번 고객 업무 시작"
        let end = "\(client.number)번 고객 업무 완료"
        
        print(start)
        usleep(700000)
        print(end)
    }
}
