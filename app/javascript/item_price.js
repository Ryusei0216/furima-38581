window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", function() {
  //入力による発火処理
  //console.log("イベント発火");
  //入力した値の出力処理
  const inputValue = priceInput.value;
  //console.log(inputValue);
  //入力した値の出力処理
  const addTaxDom = document.getElementById("add-tax-price");
  const CalcTax = Math.floor(inputValue * 0.1);
  addTaxDom.innerHTML = CalcTax.toLocaleString();
  const addProfit = document.getElementById("profit");
  const CalcProfit = Math.ceil(inputValue - (inputValue * 0.1));
  addProfit.innerHTML = CalcProfit.toLocaleString();
  });
});
