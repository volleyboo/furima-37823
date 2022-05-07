const pay = () => {
  Payjp.setPublicKey("pk_test_af486a54a20e908c090cd273");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_form[card_number]"),
      cvc: formData.get("purchase_form[security_code]"),
      exp_month: formData.get("purchase_form[card_exp_month]"),
      exp_year: `20${formData.get("purchase_form[card_exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

     

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);