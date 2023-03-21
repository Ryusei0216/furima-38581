const pay = () => {
  //PAY.JP公開鍵
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);

  //elementsインスタンスの生成
  const elements = payjp.elements();

  //フォーム作成
  const numberElement = elements.create('cardNumber'); //カード番号
  const expiryElement = elements.create('cardExpiry'); //カード期限
  const cvcElement = elements.create('cardCvc'); //CVC番号
  
  //フォームの置き換え(ruby→Javascript)
  numberElement.mount("#number-form");
  expiryElement.mount("#expiry-form"); //年と月は区別しない
  cvcElement.mount("#cvc-form");

  //イベント発火(購入処理)
  const submit = document.getElementById("button");
  
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        //トークンの生成
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden" >`; 
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
     }
      //クレカ情報のクリア
      numberElement.clear();
      expiryElement.clear(); 
      cvcElement.clear();
      document.getElementById("charge-form").submit();
   });
  });

};

window.addEventListener("load", pay);

