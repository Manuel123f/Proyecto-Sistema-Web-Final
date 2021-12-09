window.addEventListener('DOMContentLoaded', estiloEstados)
let estados = document.querySelectorAll('[data-estado]');
let chipsEstados;

function estiloEstados(){
    estados.forEach(item=>item.innerHTML=`<span>${item.innerHTML}</span>`)
    chipsEstados = document.querySelectorAll('[data-estado]>span');
    chipsEstados.forEach(item=>{
        item.innerText == 'Pendiente'?
            item.classList.add('estado-pendiente')
        : item.innerText == 'Cancelado' ?
            item.classList.add('estado-cancelado')
        : item.innerText == 'Finalizado' ?
            item.classList.add('estado-finalizado')
        : '';
    })
}
