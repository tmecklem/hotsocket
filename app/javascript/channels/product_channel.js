import consumer from "channels/consumer"


if (window.productSku) {
  consumer.subscriptions.create(
    {
      channel: "ProductChannel",
      product_sku: window.productSku
    }, {
    connected() {
      console.log(`Connected for ${window.productSku}`)
    },

    received({payload: payload}) {
      var element = document.createElement("div")
      element.innerHTML = payload
      document.body.appendChild(element)
    }
  });
}


