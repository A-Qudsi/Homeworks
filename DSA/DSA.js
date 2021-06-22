function containsCommonBetter(array1, array2) {
    let map = {};
    let answer = false;

    array1.forEach((item) => {
        if (!map[item]) {
            map[item] = true;
        }
    });
    array2.forEach(item => {
        if (map[item]) {
            answer = true;
        }
    });

    return answer;
}

const array1 = ['a', 'b', 'c', 'x'];
const array2 = ['z', 'y', 'x'];

containsCommonBetter;(array1, array2);

// forEach executes the callback function once for each array element.
// It always returns undefined.
// It does not mutate the array, but the callback can if programmed to do so.
// forEach is not chain-able like map, reduce or filter.
// The range of elements processed by forEach loop is set before the first invocation of the callback function.
// Elements appended to the array after forEach started are not visited by the loop.
// Elements that are deleted before being visited by the loop are not visited.
// If elements that are already visited are removed from the array during the iteration, later elements will be skipped.
// forEach loop once started cannot be stopped without killing the process thread. Think of it as a subscription. You have to unsubscribe to it for it to stop.
// forEach does not execute the callback for the array elements without values.

