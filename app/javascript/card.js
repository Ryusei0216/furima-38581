const pay = () => {
  //PAY.JP公開鍵
  const payjp = Payjp('pk_test_92c3351ee6653a9f002ced91')

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
    //console.log("イベント発火")
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        console.log(token)
     }
   });
  });

};

window.addEventListener("load", pay);

