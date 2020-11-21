const pay = () => {
  // 公開鍵を環境変数から取得
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);

  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    // フォームに入力された情報を取得
    const formData = new FormData(form);

    // クレジットカードの情報を取得
    const card ={
      number: formData.get("item_order[card_number]"),
      cvc: formData.get("item_order[cvc]"),
      exp_month: formData.get("item_order[exp_month]"),
      exp_year: `20${formData.get("item_order[exp_year]")}`,
    }

    // カード情報をトークン化し、処理が完了したときのみトークン情報を取得
    Payjp.createToken(card, (status, response) => {
      if (status == 200){
        const token = response.id;
      
    // トークン情報をフォームに埋め込み
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        form.insertAdjacentHTML("beforeend", tokenObj);
      }

    });


  });
};

window.addEventListener("load", pay);