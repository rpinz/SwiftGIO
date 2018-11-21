import XCTest
@testable import GIO

var cancellableCallbackFlag = false

class GIOTests: XCTestCase {

    /// test lookup and creation of App Infos
    func testAppInfoAndFile() {
        let nonexistent = AppInfo.getDefaultFor(uriScheme: "nonexistent_uri_scheme")
        XCTAssertNil(nonexistent)
        do {
            let ls = "/bin/ls"
            guard let file = File.newFor(path: ls) else { XCTFail(ls) ; return }
            guard let base = file.basename else { XCTFail() ; return }
            guard let ai = try AppInfo.createFrom(commandline: ls, applicationName: base, flags: .needs_terminal) else {
                XCTFail("Cannot creat AppInfo") ; return
            }
            XCTAssertNotNil(ai.commandline)
            XCTAssertTrue(ai.supportsFiles())
            XCTAssertFalse(ai.supportsURIs())
            XCTAssertFalse(ai.shouldShow())
            guard let ap = ai.dup() else { XCTFail() ; return }
            let dup = AppInfo(ap)
            XCTAssertEqual(ai.commandline, dup.commandline)
        } catch {
            XCTFail("Error creating AppInfo")
        }
    }

    /// test cancellables
    func testCancellable() {
        var calledBackCount = 0
        do {
            let cancellable = Cancellable()
            withUnsafeMutablePointer(to: &calledBackCount) { countPtr in
                let rv = cancellable.connect(data: countPtr, dataDestroyFunc: {
                    XCTAssertNotNil($0)
                    let countPtr = $0!.assumingMemoryBound(to: Int.self)
                    let count = countPtr.pointee
                    countPtr.pointee = count + 1
                }, callback: {
                    cancellableCallbackFlag = true
                })
                XCTAssertNotEqual(rv, 0)
                cancellable.cancel()
                XCTAssertTrue(cancellableCallbackFlag)
            }
            XCTAssertEqual(calledBackCount, 0)
        }
        XCTAssertEqual(calledBackCount, 1)
    }
}
extension GIOTests {
    static var allTests : [(String, (GIOTests) -> () throws -> Void)] {
        return [
            ("testAppInfoAndFile",  testAppInfoAndFile),
            ("testCancellable",     testCancellable),
        ]
    }
}
