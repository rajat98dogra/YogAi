var bg = document.querySelector("body");

bg.addEventListener('mousemove', (e) => {

    var x = Math.floor(e.offsetX ** 0.5 % 10)
    var y = Math.floor(e.offsetY ** 0.5 % 10)

    var el = document.querySelectorAll('#red,#orange1,#orange,#purple,#red2,#yellow')
    // #orange1,#orange,#purple,#red,#yellow
    for (var i = 0; i < el.length; i++) {
        el[i].style.transform = `translate(${x}px, ${y}px)`;

        console.log(el[i])
    }
})