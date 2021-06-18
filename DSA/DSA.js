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