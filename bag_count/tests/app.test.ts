import * as chai from "chai";
const expect = chai.expect;
import { getBagCounts } from "../src/app";

describe("#getBagCounts", function () {
  it("should get bag count for 0 kgs", function () {
    const bags = getBagCounts(0);
    expect(bags).eql({ 1: 0, 2: 0, 4: 0 });
  });
  it("should get bag count for 1 kg", function () {
    const bags = getBagCounts(1);
    expect(bags).eql({ 1: 1, 2: 0, 4: 0 });
  });
  it("should get bag count for 2 kg", function () {
    const bags = getBagCounts(2);
    expect(bags).eql({ 1: 0, 2: 1, 4: 0 });
  });
  it("should get bag count for 4 kg", function () {
    const bags = getBagCounts(4);
    expect(bags).eql({ 1: 0, 2: 0, 4: 1 });
  });
  it("should get bag count for 8 kg", function () {
    const bags = getBagCounts(8);
    expect(bags).eql({ 1: 0, 2: 0, 4: 2 });
  });
  it("should get bag count for 5 kg", function () {
    const bags = getBagCounts(5);
    expect(bags).eql({ 1: 1, 2: 0, 4: 1 });
  });
  it("should get bag count for 10000000 kg", function () {
    const bags = getBagCounts(10000000);
    expect(bags).eql({ 1: 0, 2: 0, 4: 2500000 });
  });
});
