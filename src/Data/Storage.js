export const getItem_ = function(noStorage, noValue, left, right, storage, key) {
  if (localStorage) {
    var result = storage.getItem(key);
    return result !== undefined ? right(result) : left(noValue(key));
  } else {
    return left(noStorage);
  }
};

export const setItem_ = function (storage, key, value) {
  return storage.setItem(key, value);
};
