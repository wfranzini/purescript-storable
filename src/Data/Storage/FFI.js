export const localStorage_ = function (just, nothing) {
  return localStorage ? just(localStorage) : nothing;
};

export const sessionStorage_ = function (just, nothing) {
  return sessionStorage ? just(sessionStorage) : nothing;
};

export const keys_ = function (storage) {
  return Object.keys(storage);
};
