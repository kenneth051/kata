"use strict";
// ```Clients can order between 1 and  seed. We stock seed in bags of 1kg, 2kg, 4kg. On distribution day,
// we need to load the truck with the correct amount of each bag size for our clients.
Object.defineProperty(exports, "__esModule", { value: true });
// **Task**
// Implement a function which, given a list of client seed orders, calculates the required bag count for each individual bag size.
//  Your function should try to assign larger bag sizes first. Write this logic in the provided getBagCounts function in getBagCounts.js.
// *Parameters*
// * clientOrders: Array of integers, each representing a client seed order. For example, [5, 12, 12] means three clients are receiving seed.
// One client ordered 5kg and two clients ordered 12kg.
// * availableBagSizes: Array of integers, each representing an available bag size. You can assume that this will always be [1, 2, 4];
// *Return value*
// Your return value should be an array of objects, each object representing one of the available bag sizes.
// * Each object should have a 'size' property (number of kg in the bag) and 'count' property (the number of bags needed)
// * The objects should be sorted in descending order by 'size'
// * You should include all available bag sizes, even when the count is zero. In our example, we've included { size: 2, count: 0 }
// ```
function getBagCounts(order) {
    var bagCount = { 1: 0, 2: 0, 4: 0 };
    var bagSizes = [4, 2, 1];
    bagSizes.forEach((size) => {
        while (order >= size) {
            bagCount[size] += 1;
            order -= size;
        }
    });
    return bagCount;
}
exports.default = getBagCounts;
//# sourceMappingURL=app.js.map