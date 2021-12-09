window.addEventListener('DOMContentLoaded', compobarNumero)
let dinero = document.getElementById('cantidad_ganancia');
const idinero = dinero;

function compobarNumero(){
    if(dinero.innerText >= 1000 && dinero.innerText <= 9999){
       let td = dinero.innerText.slice(0,2);
       td = td[1] == 0 ?
            `${td.slice(0,1)}<span class='h5'>mil</span>`:
            `${td.slice(0,1)},${td.slice(1)}<span class='h5'>mil</span>`;
       dinero.innerHTML = td;
    }else if(dinero.innerText >= 10000){
       let td = dinero.innerText.slice(0,3);
       td = td[2] == 0 ?
       `${td.slice(0,2)}<span class='h5'>mil</span>`:
       `${td.slice(0,2)},${td.slice(2)}<span class='h5'>mil</span>`;
       dinero.innerHTML = td;
    }
}