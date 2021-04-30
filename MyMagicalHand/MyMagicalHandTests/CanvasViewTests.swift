import XCTest
@testable import MyMagicalHand

class CanvasViewTests: XCTestCase {
    var sut: CanvasView!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CanvasView()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testView_whenErase_allPathsAreClear() {
        //given
        sut.touchesBegan(Set<UITouch>(), with: nil)
        //when
        sut.erase()
        //then
        XCTAssertEqual(sut.paths.count, 0)
    }
}
