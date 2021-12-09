document.addEventListener("DOMContentLoaded", () => {
  productos();
});
const template_card = document.getElementById("template-card_producto").content;
const container_productos_ = document.getElementById("cards-productos--agregar");
const container_productos_actualizar = document.getElementById("cards-productos--actualizar");


const productos = async () => {
  try {
    const res = await fetch("../producto.json");
    const data = await res.json();
    pintarCards(data);
    pintarCardsActualizar(data);
  } catch (error) {
    console.log(error);
  }
};

const pintarCards = (data) => {
  container_productos_.innerHTML = "";
  data.forEach((producto) => {
    template_card.querySelector(".card-producto").dataset.tipo = "agregar";
    template_card.querySelector(".card-producto").dataset.category =
      producto.categoria;
    template_card.querySelector(".card-producto").dataset.description =
      producto.description;
    template_card.querySelector(".card-producto").dataset.nombre =
      producto.nombre;
    template_card.querySelector(".card-producto_btn-agregar").dataset.id =
      producto.id;
    template_card.querySelector("img").src = producto.img;
    template_card.querySelector(".card-producto_title p").textContent =
      producto.nombre;
    template_card.querySelector(".card-producto_stock span").textContent =
      producto.stock;
    template_card.querySelector(".card-producto_categoria").textContent =
      producto.categoria;
    template_card.querySelector(".card-precio_numero").textContent =
      producto.precio;
    const clone = template_card.cloneNode(true);
    fragment.appendChild(clone);
  });
  container_productos_.appendChild(fragment);
};
const pintarCardsActualizar = (data) => {
  container_productos_actualizar.innerHTML = "";
  data.forEach((producto) => {
    template_card.querySelector(".card-producto").dataset.tipo = "agregar";
    template_card.querySelector(".card-producto").dataset.category =
      producto.categoria;
    template_card.querySelector(".card-producto").dataset.description =
      producto.description;
    template_card.querySelector(".card-producto").dataset.nombre =
      producto.nombre;
    template_card.querySelector(".card-producto_btn-agregar").dataset.id =
      producto.id;
    template_card.querySelector("img").src = producto.img;
    template_card.querySelector(".card-producto_title p").textContent =
      producto.nombre;
    template_card.querySelector(".card-producto_stock span").textContent =
      producto.stock;
    template_card.querySelector(".card-producto_categoria").textContent =
      producto.categoria;
    template_card.querySelector(".card-precio_numero").textContent =
      producto.precio;
    const clone = template_card.cloneNode(true);
    fragment.appendChild(clone);
  });
  container_productos_actualizar.appendChild(fragment);
};