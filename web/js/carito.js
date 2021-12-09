document.addEventListener("DOMContentLoaded",()=>{
    if(localStorage.getItem('carrito'))
    carrito = JSON.parse(localStorage.getItem('carrito'))
    descuento_agregar = localStorage.getItem('descuento')
    pintarCarro_agregar();
});

const template_carrito = document.getElementById('template-carrito').content;
const template_datos = document.getElementById('template-footer-datos').content;
const template_descripcion_producto = document.getElementById('template_card_descripcion').content;
const vista_descripcion = document.getElementById('descripcion');
const fragment = document.createDocumentFragment();
/* funciones de agregar */
let carrito = {};
const cards_productos = document.getElementById('cards-productos--agregar');
const items_agregar = document.getElementById('items--agregar');
const datos_agregar = document.getElementById('seccion-datos--agregar');
let input_igv_agregar = document.getElementById('igv_agregar');
let input_total_agregar = document.getElementById('total_agregar');
let descuento_agregar=0;
/* funciones de actualizar */
const template_datos_actualizar = document.getElementById('template-footer-datos_actualizar').content;
let carrito_actualizar = {};
/* evento de actualizar */
const btn_actualizar = document.getElementById('btnradio2');
const cards_productos_actualizar = document.getElementById('cards-productos--actualizar');
const items_actualizar = document.getElementById('items--actualizar');
const datos_actualizar = document.getElementById('seccion-datos--actualizar');
let input_igv_actualizar = document.getElementById('igv_actualizar');
let input_total_actualizar = document.getElementById('total_actualizar');
let descuento_actualizar=0;
btn_actualizar.addEventListener('input',e=>{
    if(Object.keys(carrito_actualizar).length === 0 ){
        Object.values(items_actualizar.children).forEach(objeto=> {
            console.log(objeto)
            setCarrito_actualizar_p(objeto)
        })
    }
});

cards_productos.addEventListener('click',e=>{
    addCarrito_agregar(e);
    verDescripcion(e);
})
datos_agregar.addEventListener('focusout',(e)=> {
    addDescuento_agregar(e);
});
items_agregar.addEventListener('click',e=>{
    btnAccion_agregar(e);
});
/* actualizar */
cards_productos_actualizar.addEventListener('click',e=>{
    addCarrito_actualizar(e);
    verDescripcion(e);
})
datos_actualizar.addEventListener('focusout',(e)=> {
    addDescuento_actualizar(e);
});
items_actualizar.addEventListener('click',e=>{
    btnAccion_actualizar(e);
});
/* limpiar descripcion */
vista_descripcion.addEventListener('click',e=>{(e.target.classList.contains('descripcion_btn')||e.target.classList.contains('btn-close'))?limpiarDescripcion():''})

const addCarrito_agregar = e=>{
    if(e.target.classList.contains('card-producto_btn-agregar')){
        setCarrito_agregar(e.target.parentElement)
    }
    e.stopPropagation();
}
const addCarrito_actualizar = e=>{
    if(e.target.classList.contains('card-producto_btn-agregar')){
        setCarrito_actualizar(e.target.parentElement)
    }
    e.stopPropagation();
}

const setCarrito_agregar = objeto =>{
    const producto = {
        id: objeto.querySelector('.card-producto_btn-agregar').dataset.id,
        img: objeto.querySelector('img').src,
        title: objeto.querySelector('.card-producto_title p').textContent,
        categoria: objeto.querySelector('.card-producto_categoria').textContent,
        precio: objeto.querySelector('.card-precio_numero').textContent,
        stock: objeto.querySelector('.card-producto_stock span').textContent,
        cantidad: 1
    }
    if(carrito.hasOwnProperty(producto.id)){
        producto.cantidad = carrito[producto.id].cantidad + 1;
    }
    carrito[producto.id]= {...producto};
    pintarCarro_agregar();
}
const setCarrito_actualizar = objeto =>{
    const producto = {
        id: objeto.querySelector('.card-producto_btn-agregar').dataset.id,
        img: objeto.querySelector('img').src,
        title: objeto.querySelector('.card-producto_title p').textContent,
        categoria: objeto.querySelector('.card-producto_categoria').textContent,
        precio: objeto.querySelector('.card-precio_numero').textContent,
        stock: objeto.querySelector('.card-producto_stock span').textContent,
        cantidad: 1
    }
    if(carrito_actualizar.hasOwnProperty(producto.id)){
        producto.cantidad = carrito_actualizar[producto.id].cantidad + 1;
    }
    carrito_actualizar[producto.id]= {...producto};
    pintarCarro_actualizar();
}
const setCarrito_actualizar_p= objeto =>{
    const producto = {
        id: objeto.querySelector('#id_producto').value,
        img: objeto.querySelector('img').src,
        title: objeto.querySelector('.table_producto_title p').textContent,
        categoria: objeto.querySelector('.table_categoria').textContent,
        precio: objeto.querySelector('.table_precio-producto span').textContent,
        stock: objeto.querySelector('#cantidad_producto').max,
        cantidad: parseInt(objeto.querySelector('#cantidad_producto').value)
    }
    if(carrito_actualizar.hasOwnProperty(producto.id)){
        producto.cantidad = carrito_actualizar[producto.id].cantidad + 1;
    }
    carrito_actualizar[producto.id]= {...producto};
    pintarCarro_actualizar();
}

const pintarCarro_agregar=()=>{
    items_agregar.innerHTML=``;
    Object.values(carrito).forEach(producto=>{
        template_carrito.querySelector('img').src = producto.img;
        template_carrito.querySelector('#id_producto').value = producto.id;
        template_carrito.querySelector('.table_producto_title p').textContent = producto.title;
        template_carrito.querySelector('.table_categoria').textContent = producto.categoria;
        template_carrito.querySelector('.mas-producto').dataset.id = producto.id;
        template_carrito.querySelector('.menos-producto').dataset.id = producto.id;
        template_carrito.querySelector('.btn-close').dataset.id = producto.id;
        template_carrito.querySelector('#cantidad_producto').value = producto.cantidad;
        template_carrito.querySelector('#cantidad_producto').max = producto.stock;
        template_carrito.querySelector('.table_precio-producto span').textContent = producto.cantidad * producto.precio;
        template_carrito.querySelector('#precio').value = producto.cantidad * producto.precio;

        const clone = template_carrito.cloneNode(true);
        fragment.appendChild(clone);
    })
    items_agregar.appendChild(fragment);
    pintarDatos_agregar();
    localStorage.setItem('carrito',JSON.stringify(carrito));
    localStorage.setItem('descuento',parseFloat(descuento_agregar))
/*     console.log(carrito) */
}
const pintarCarro_actualizar=()=>{
    items_actualizar.innerHTML=``;
    Object.values(carrito_actualizar).forEach(producto=>{
        template_carrito.querySelector('img').src = producto.img;
        template_carrito.querySelector('#id_producto').value = producto.id;
        template_carrito.querySelector('.table_producto_title p').textContent = producto.title;
        template_carrito.querySelector('.table_categoria').textContent = producto.categoria;
        template_carrito.querySelector('.mas-producto').dataset.id = producto.id;
        template_carrito.querySelector('.menos-producto').dataset.id = producto.id;
        template_carrito.querySelector('.btn-close').dataset.id = producto.id;
        template_carrito.querySelector('#cantidad_producto').value = producto.cantidad;
        template_carrito.querySelector('#cantidad_producto').max = producto.stock;
        template_carrito.querySelector('.table_precio-producto span').textContent = producto.cantidad * producto.precio;
        template_carrito.querySelector('#precio').value = producto.cantidad * producto.precio;

        const clone = template_carrito.cloneNode(true);
        fragment.appendChild(clone);
    })
    items_actualizar.appendChild(fragment);
    pintarDatos_actualizar();
}

const pintarDatos_agregar=(descuento=descuento_agregar)=>{
    datos_agregar.innerHTML=``;
    if(Object.keys(carrito).length === 0){
        datos_agregar.innerHTML=`<div class="seccion-datos-descuento h6">
        Descuento: S/. <input type="number" min="0" max="100" id="descuento--agregar" value='${descuento}'>
      </div>
      <div class="seccion-datos-subtotal--agregar h6">
        Subtotal: S/.<span>0</span>
      </div>
      <div class="h6" id="igv-detalleVenta--agregar">
        IGV: S/.<span>0</span>
      </div>
      <div class="h4 total-detalleVenta" id="total-detalleVenta--agregar">
        Total: S/.<snap>0</snap>
      </div>`
      return
    }
    const nCantidad = Object.values(carrito).reduce((acc,{cantidad})=>acc+cantidad,0)
    const subTotal = Object.values(carrito).reduce((acc,{cantidad,precio})=>acc+cantidad*precio,0)
    const igv = parseFloat((subTotal * 0.18).toFixed(2));
    const total = parseFloat((subTotal + igv - descuento).toFixed(2));
    template_datos.querySelector('.seccion-datos-subtotal--agregar span').textContent = subTotal;
    template_datos.querySelector('#descuento--agregar').value = descuento;
    template_datos.querySelector('#igv-detalleVenta--agregar span').textContent = igv;
    template_datos.querySelector('#total-detalleVenta--agregar span').textContent = total;
    input_igv_agregar.value = igv;
    input_total_agregar.value = total;
    const clone = template_datos.cloneNode(true);
    fragment.appendChild(clone);
    datos_agregar.appendChild(fragment);
}
const pintarDatos_actualizar=(descuento=descuento_actualizar)=>{
    datos_actualizar.innerHTML=``;
    if(Object.keys(carrito_actualizar).length === 0){
        datos_actualizar.innerHTML=`<div class="seccion-datos-descuento h6">
        Descuento: S/. <input type="number" min="0" max="100" id="descuento--actualizar" value='${descuento}'>
      </div>
      <div class="seccion-datos-subtotal--actualizar h6">
        Subtotal: S/.<span>0</span>
      </div>
      <div class="h6" id="igv-detalleVenta--actualizar">
        IGV: S/.<span>0</span>
      </div>
      <div class="h4 total-detalleVenta" id="total-detalleVenta--actualizar">
        Total: S/.<snap>0</snap>
      </div>`
      return
    }
    const nCantidad = Object.values(carrito_actualizar).reduce((acc,{cantidad})=>acc+cantidad,0)
    const subTotal = Object.values(carrito_actualizar).reduce((acc,{cantidad,precio})=>acc+cantidad*precio,0)
    const igv = parseFloat((subTotal * 0.18).toFixed(2));
    const total = parseFloat((subTotal + igv - descuento).toFixed(2));
    template_datos_actualizar.querySelector('.seccion-datos-subtotal--actualizar span').textContent = subTotal;
    template_datos_actualizar.querySelector('#descuento--actualizar').value = descuento;
    template_datos_actualizar.querySelector('#igv-detalleVenta--actualizar span').textContent = igv;
    template_datos_actualizar.querySelector('#total-detalleVenta--actualizar span').textContent = total;
    input_igv_actualizar.value = igv;
    input_total_actualizar.value = total;
    const clone = template_datos_actualizar.cloneNode(true);
    fragment.appendChild(clone);
    datos_actualizar.appendChild(fragment);
}

const addDescuento_agregar = e=>{
    if(e.target.id=='descuento--agregar' && e.target.value!==''){
        descuento_agregar=e.target.value;
        pintarCarro_agregar();
    }else if(e.target.id=='descuento--agregar' && e.target.value==''){
        descuento_agregar=0;
        pintarCarro_agregar();
    }
    e.stopPropagation();
}
const addDescuento_actualizar = e=>{
    if(e.target.id=='descuento--actualizar' && e.target.value!==''){
        descuento_actualizar=e.target.value;
        pintarCarro_actualizar();
    }else if(e.target.id=='descuento--actualizar' && e.target.value==''){
        descuento_actualizar=0;
        pintarCarro_actualizar();
    }
    e.stopPropagation();
}

const btnAccion_agregar= e=>{
/*     console.log(e.target) */
    if(e.target.classList.contains('mas-producto')){
        const producto = carrito[e.target.dataset.id]
        producto.cantidad++
        carrito[e.target.dataset.id]={...producto}
    }
    if(e.target.classList.contains('menos-producto')){
        const producto = carrito[e.target.dataset.id]
        producto.cantidad--
        (producto.cantidad === 0 )?
        delete carrito[e.target.dataset.id]:
        carrito[e.target.dataset.id]={...producto}
        input_igv_agregar.value = 0;
        input_total_agregar.value = 0;
    }
    if(e.target.classList.contains('btn-close')){
        delete carrito[e.target.dataset.id]
        input_igv_agregar.value = 0;
        input_total_agregar.value = 0;
    }
    e.stopPropagation();
    pintarCarro_agregar();
}
const btnAccion_actualizar= e=>{
/*     console.log(e.target) */
    if(e.target.classList.contains('mas-producto')){
        const producto = carrito_actualizar[e.target.dataset.id]
        producto.cantidad++
        carrito_actualizar[e.target.dataset.id]={...producto}
    }
    if(e.target.classList.contains('menos-producto')){
        const producto = carrito_actualizar[e.target.dataset.id]
        producto.cantidad--
        (producto.cantidad === 0 )?
        delete carrito_actualizar[e.target.dataset.id]:
        carrito_actualizar[e.target.dataset.id]={...producto}
        input_igv_actualizar.value = 0;
        input_total_actualizar.value = 0;
    }
    if(e.target.classList.contains('btn-close')){
        delete carrito_actualizar[e.target.dataset.id]
        input_igv_actualizar.value = 0;
        input_total_actualizar.value = 0;
    }
    e.stopPropagation();
    pintarCarro_actualizar();
}
/* vista descripcion */
const verDescripcion = e =>{
    if(e.target.classList.contains('text-body-2')){
        setDescripcion(e);
    }
    e.stopPropagation();
}
const setDescripcion = e=>{
    const card_producto = e.target.parentElement.parentElement.parentElement.parentElement;
    const producto = {
        img: card_producto.querySelector('img').src,
        nombre: card_producto.querySelector('.card-producto_title p').textContent,
        categoria: card_producto.querySelector('.card-producto_categoria').textContent,
        precio: card_producto.querySelector('.card-precio_numero').textContent,
        stock: card_producto.querySelector('.card-producto_stock span').textContent,
        descripcion: card_producto.dataset.description
    }
    pintarDescripcion(producto);
}
const pintarDescripcion = objeto =>{
    limpiarDescripcion();
    template_descripcion_producto.querySelector('img').src = objeto.img;
    template_descripcion_producto.querySelector('.descripcion_title').textContent = objeto.nombre;
    template_descripcion_producto.querySelector('.descripcion-text').textContent = objeto.descripcion;
    template_descripcion_producto.querySelector('.descripcion_categoria').textContent = objeto.categoria;
    template_descripcion_producto.querySelector('.stock span').textContent = objeto.stock;
    template_descripcion_producto.querySelector('.h3').textContent =  objeto.precio;
    const clone = template_descripcion_producto.cloneNode(true);
    fragment.appendChild(clone);
    vista_descripcion.appendChild(fragment);
    
}

const limpiarDescripcion = ()=> vista_descripcion.innerHTML='';