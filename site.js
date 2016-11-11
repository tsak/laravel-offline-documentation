document.addEventListener('DOMContentLoaded', function() {
  var p = document.getElementById('navigation');
  Array.prototype.slice.call(p.children)
    .map(function(x) {
      return p.removeChild(x);
    })
    .sort(function(x, y) {
      console.log(
        x.getElementsByTagName('a')[0].innerHTML,
        y.getElementsByTagName('a')[0].innerHTML,
        x.getElementsByTagName('a')[0].innerHTML.localeCompare(y.getElementsByTagName('a')[0].innerHTML)
      );
      return x.getElementsByTagName('a')[0].innerHTML.localeCompare(y.getElementsByTagName('a')[0].innerHTML);
    })
    .forEach(function(x) {
      p.appendChild(x);
    });
}, false);