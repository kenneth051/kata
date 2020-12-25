import * as chai from "chai";
import {getDiscount, getPriceOfDiscountBooks, book_store, classifyBooks} from "../src/book_store"
const expect = chai.expect;

describe("#book_store", function () {
  it("should get the discount when we buy 2 books of different authors", function () {
    expect(getDiscount(2)).eql(0.8);
  });
  it("should get the discount when we buy 3 books of different authors", function () {
    expect(getDiscount(3)).eql(2.4);
  });
  it("should get the discount when we buy 3 books of different authors", function () {
    expect(getDiscount(5)).eql(10);
  });
  it("should get the price of two book",function(){
    expect(getPriceOfDiscountBooks({"2":0,"3":1,"4":0,"5":1})).eq(51.6)
  })
  it("should get the price of three book",function(){
    expect(getPriceOfDiscountBooks({"2":0,"3":0,"4":0,"5":8})).eq(240)
  })
  it("should get the price of two book",function(){
    expect(getPriceOfDiscountBooks({"2":1,"3":0,"4":0,"5":0})).eq(15.2)
  })
  it("should return a classified object of two books",function(){
    expect(classifyBooks([1,1])).eql({"2":1,"3":0,"4":0,"5":0,"no_discount":0})
  })
  it("should return a classified object of 40 books",function(){
    expect(classifyBooks([8,8,8,8,8])).eql({"2":0,"3":0,"4":0,"5":8,"no_discount":0})
  })
  it("should return a classified object of 8 books",function(){
    expect(classifyBooks([2,2,2,1,1])).eql({"2":0,"3":1,"4":0,"5":1,"no_discount":0})
  })
  it("should return a classified object of 3 books",function(){
    expect(classifyBooks([2,1])).eql({"2":1,"3":0,"4":0,"5":0,"no_discount":1})
  })
  it("book_store should get the discount of 2 books with two from the same author ", function(){
    expect(book_store([1,1])).eql(15.2)
  })
  it("book_store should get the discount of 3 books with two from the same author ", function(){
    expect(book_store([2,1])).eql(23.2)
  })
  it("book_store should get the discount of 40 books with two from the same author ", function(){
    expect(book_store([8,8,8,8,8])).eql(240)
  })
});
