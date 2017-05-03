import Quick
import Nimble
@testable import Emojize

class EmojizeTests: QuickSpec {
  override func spec() {
    let check = { (_ input: String, block: @escaping (String) -> Void) in
      block(input.emojified)
      block(NSMutableAttributedString(string: input).emojified.string)
      block(NSAttributedString(string: input).emojified.string)
    }

    it("doesn't alter regular strings") {
      check("Hello") {
        expect($0).to(equal("Hello"))
      }
    }

    it("handles empty strings") {
      check("") {
        expect($0).to(equal(""))
      }
    }

    it("handles only one :") {
      check(":") {
        expect($0).to(equal(":"))
      }
    }

    it("handles half open :") {
      check(":xxx") {
        expect($0).to(equal(":xxx"))
      }
    }

    it("replaces single unicode chars") {
      check(":mushroom:") {
        expect($0).to(equal("🍄"))
      }
    }

    it("replaces multiply unicode chars") {
      check(":mushroom: :car:") {
        expect($0).to(equal("🍄 🚗"))
      }
    }

    it("ignores chars it cannot find") {
      check(":--not-found--:") {
        expect($0).to(equal(":--not-found--:"))
      }
    }

    it("replaces unicode chars surrounded by text") {
      check("This is my :car:, it's fast") {
        expect($0).to(equal("This is my 🚗, it's fast"))
      }
    }

    it("handles found with non found") {
      check("ABC :car: DEF :not-found:") {
        expect($0).to(equal("ABC 🚗 DEF :not-found:"))
      }
    }

    it("handles non closed tags") {
      check("ABC :car: DEF : XYZ") {
        expect($0).to(equal("ABC 🚗 DEF : XYZ"))
      }
    }

    it("handles (ending) non closed tags") {
      check("ABC :house: DEF : XYZ :car:") {
        expect($0).to(equal("ABC 🏠 DEF : XYZ 🚗"))
      }
    }
  }
}
