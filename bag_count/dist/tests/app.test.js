"use strict";
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const chai = __importStar(require("chai"));
const app_1 = __importDefault(require("../src/app"));
const expect = chai.expect;
describe('getBagCounts', function () {
    it('should return an array of objects with size and count as keys', function () {
        const bagCount = app_1.default(0);
        expect(bagCount).to.eql({ 1: 0, 2: 0, 4: 0 });
    });
    it("should return a valid output when 1 is passed in as a parameter", function () {
        const bagCount = app_1.default(1);
        expect(bagCount).to.eql({ 1: 1, 2: 0, 4: 0 });
    });
    it("should return a valid output when 2 is passed in as a parameter", function () {
        const bagCount = app_1.default(2);
        expect(bagCount).to.eql({ 1: 0, 2: 1, 4: 0 });
    });
    it("should return a valid output when 4 is passed in as a parameter", function () {
        const bagCount = app_1.default(4);
        expect(bagCount).to.eql({ 1: 0, 2: 0, 4: 1 });
    });
    it("should return a valid output when 5 is passed in as a parameter", function () {
        const bagCount = app_1.default(5);
        expect(bagCount).to.eql({ 1: 1, 2: 0, 4: 1 });
    });
    it("should return a valid output when 8 is passed in as a parameter", function () {
        const bagCount = app_1.default(8);
        expect(bagCount).to.eql({ 1: 0, 2: 0, 4: 2 });
    });
    it("should return a valid output when 15 is passed in as a parameter", function () {
        const bagCount = app_1.default(15);
        expect(bagCount).to.eql({ 1: 1, 2: 1, 4: 3 });
    });
    it("should return a valid output when 15 is passed in as a parameter", function () {
        const bagCount = app_1.default(1000000);
        expect(bagCount).to.eql({ 1: 0, 2: 0, 4: 250000 });
    });
});
//# sourceMappingURL=app.test.js.map