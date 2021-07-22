function fee () {
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("keyup",() =>{
    //販売手数料
    const calculationFee = itemPrice.value * 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = calculationFee;
    //販売利益
    const salesProfit = itemPrice.value - calculationFee;
    const profit = document.getElementById("profit");
    profit.innerHTML = salesProfit
  });
};

window.addEventListener('load', fee)