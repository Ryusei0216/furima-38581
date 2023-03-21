window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", function() {
  //入力した値の出力処理
  const inputValue = priceInput.value;
  //入力した値の出力処理
  const addTaxDom = document.getElementById("add-tax-price");
  const CalcTax = Math.floor(inputValue * 0.1);
  addTaxDom.innerHTML = CalcTax.toLocaleString();
  const addProfit = document.getElementById("profit");
  const CalcProfit = Math.floor(inputValue - (inputValue * 0.1));
  addProfit.innerHTML = CalcProfit.toLocaleString();
  });
});
