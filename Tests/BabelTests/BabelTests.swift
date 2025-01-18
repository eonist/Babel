import Testing
@testable import Babel

// maybe add something from: https://github.com/wendyliga/resource-spm/blob/master/Tests/resource-spmTests/resource_spmTests.swift
// test all translations on every PR / Commit
// more sophisticated unit-test can be added later. 


@Test func example() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    XCTAssertTrue(true == Optional(true)) // placeholder code for now
    // try to get a variable from github action regarding which languages that was added. use the language codes and assert that all keys has content for each language
    // test all translations on every PR / Commit. Loop through keys in english strings. and print assert each language that they have string content
}