//  To try and encourage more sales of different books from a popular 5 book series, a bookshop has decided to offer discounts on multiple book purchases.
//  One copy of any of the five books costs $8.
//  If, however, you buy two different books, you get a 5% discount on those two books.
//  If you buy 3 different books, you get a 10% discount.
//  If you buy 4 different books, you get a 20% discount.
//  If you buy all 5, you get a 25% discount.
//  Note: that if you buy four books, of which 3 are different titles, you get a 10% discount on the 3 that form part of a set, but the fourth book still costs $8.
//  Your mission is to write a piece of code to calculate the price of any conceivable shopping basket (containing only books of the same series), giving as big a discount as possible.
//  2 copies of the first book
//  2 copies of the second book
//  2 copies of the third book
//  1 copy of the fourth book
//  1 copy of the fifth book
//  For a total of $51.60


// [1, 1] = 15.2
// [2, 1] = 23.2
// [2, 2, 2, 1, 1] = 51.60;
// [8, 8, 8, 8, 8] = 240;

//getdiscount
//

const cost =8
const cost_discount={"2":5,"3":10,"4":20,"5":25}

export function getDiscount(quantity:number,discount=cost_discount):number{
    return (cost*quantity)*discount[quantity]/100
}

export function getPriceOfDiscountBooks(discount_books){
    let price=0;
    Object.keys(discount_books).forEach((discount)=>{
        const actual_discount = getDiscount(Number(discount))
        const price_before_discount = cost* Number(discount);
       const actual_price=(price_before_discount-actual_discount)*discount_books[discount]
       price += actual_price
    });
    return price
}

export function classifyBooks(books,discount_books={"2":0,"3":0,"4":0,"5":0,"no_discount":0}){
    while(books.length>1){
        for(let i=0;i < books.length; i++){
            if (books[i]>=1){
                books[i]-=1
            }
        }
        discount_books[books.length]+=1
        books=books.filter((val:number)=>val!==0)
    }
    discount_books.no_discount=books[0]||0
    return discount_books
}
export function book_store(books){
    const classfied_books= classifyBooks(books)
    const{no_discount,...discount_books}=classfied_books
    return getPriceOfDiscountBooks(discount_books)+(no_discount*cost)
}
