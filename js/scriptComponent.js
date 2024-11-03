fetch('component/header.html')
.then(response => response.text())
.then(data => {
    document.getElementById('header-container').innerHTML = data;
});
fetch('component/footer.html')
.then(response => response.text())
.then(data => {
    document.getElementById('footer-container').innerHTML = data;
});
fetch('route.html')
.then(response => response.text())
.then(data => {
    document.getElementById('route-container').innerHTML = data;
});