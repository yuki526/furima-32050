function itemPrice (){
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    // 販売手数料と利益を計算(手数料は小数点以下切り捨て)
    const charge = Math.floor(price.value * 0.1);
    const profit = price.value - charge;

    // 販売手数料と利益の要素を取得
    const showCharge = document.getElementById("add-tax-price")
    const showProfit = document.getElementById("profit")

    // 置き換え
    showCharge.innerHTML = `${charge}`
    showProfit.innerHTML = `${profit}`
    
  });
}

window.addEventListener('load', itemPrice);