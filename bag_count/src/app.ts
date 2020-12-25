//mocha -R mocha-slow-reporter

// Clients can order starting from 1 kg. We stock seed in bags of 1kg, 2kg, 4kg. On distribution day,
// we need to load the truck with the correct amount of each bag size for our clients.

// **Task**
// Implement a function which, given client's seed orders, calculates the required bag count for each individual bag size.
//  Your function should try to assign larger bag sizes first. Write this logic in the provided getBagCounts function in getBagCounts.js.

// *Parameters*
// * clientOrders: integer, representing a client seed order. For example, 5.

// *Return value*
// Your return value should be an object representing one of the available bag sizes.
// * You should include all available bag sizes, even when the count is zero.

export const getBagCounts = (
  order: number,
  bags: { 1: number; 2: number; 4: number } = { 1: 0, 2: 0, 4: 0 },
  bagCount: Array<number> = [4, 2, 1]
): { 1: number; 2: number; 4: number } => {
  bagCount.forEach(size => {
    if (order >= size) {
      const bagSizeCount = Math.floor(order / size);
      bags[size] = bagSizeCount;
      order -= bagSizeCount * size;
    }
  });
  return bags;
};
