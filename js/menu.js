/**
 * Created by valentin on 1/27/16.
 */

var container = document.querySelector('.container-fluid');
var main = document.querySelector('.main');

function toggleSidebar(){
    isShowingSidebar() ? hideSidebar() : showSidebar();
}

function showSidebar(){
    container.classList.add('show-sidebar');
}

function hideSidebar(){
    container.classList.remove('show-sidebar');
}

function isShowingSidebar(){
    return container.classList.contains('show-sidebar');
}

document.querySelector('.hamburger').addEventListener('click', toggleSidebar, false);

container.addEventListener('click', function(e){
    if(isShowingSidebar() && main.contains(e.target)){
        e.preventDefault();
        hideSidebar();
    }
}, true);
