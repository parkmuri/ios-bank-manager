//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by 리지, 무리 on 2023/03/06.
//

import XCTest
@testable import BankManagerUIApp
final class LinkedListTest: XCTestCase {
    var sut: LinkedList<String>!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<String>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    //MARK: - isEmpty test
    func test_값이없는경우_isEmpty가_true다() {
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_값이있는경우_isEmpty가_false다() {
        // given
        sut.enqueue("1")
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    //MARK: - enqueue test
    func test_enqueue된값이없을때_dequeue실행시_nil을반환한다() {
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    //MARK: - dequeue test
    func test_enqueue된값이_1_2_3_일때_dequeue실행시_1을반환한다() {
        // given
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        let expectation = "1"
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
    }

    func test_enqueue된값이_있을때_dequeue실행시_head가_변경된다() {
        // given
        sut.enqueue("4")
        sut.enqueue("5")
        sut.enqueue("6")
        let expectation = "5"
        
        // when
        let _ = sut.dequeue()
        let result = sut.head?.data
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue된값이_있을때_dequeue실행시_enqueue된순서대로_값을_반환한다() {
        // given
        sut.enqueue("4")
        sut.enqueue("5")
        let expectation = "4"
        let expectation2 = "5"
        
        // when
        let result = sut.dequeue()
        let result2 = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
        XCTAssertEqual(result2, expectation2)
    }
    
    //MARK: - peek test
    func test_enqueue된값이_있을때_peek접근시_첫번째값을_반환한다() {
        // given
        sut.enqueue("11")
        sut.enqueue("12")
        let expectation = "11"
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    //MARK: - clear test
    func test_clear실행시_isEmpty는_true다() {
        // given
        sut.enqueue("10")
        sut.enqueue("20")
   
        // when
        sut.clear()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
 }
