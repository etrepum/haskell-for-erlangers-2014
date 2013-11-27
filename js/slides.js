window.addEventListener('DOMContentLoaded', function () {
  var Reveal = window.Reveal,
      d3 = window.d3;

  function withFreshSVG(f) {
    var saved = null;
    return function (slide) {
      if (saved === null) {
        saved = slide.querySelector('svg').cloneNode(true);
      }
      var newSvg = saved.cloneNode(true);
      slide.replaceChild(newSvg, slide.querySelector('svg'));
      return f(slide);
    };
  }
  function reduce(arrayLike, callback, initial) {
    return Array.prototype.reduce.call(arrayLike, callback, initial);
  }
  function forEach(arrayLike, callback) {
    return Array.prototype.forEach.call(arrayLike, callback);
  }
  function toSVGPoint(svg, elem, x, y) {
    var pt = svg.createSVGPoint();
    pt.x = 0|x;
    pt.y = 0|y;
    if (typeof elem === 'string') {
      elem = svg.querySelector(elem);
    }
    return pt.matrixTransform(elem.getTransformToElement(svg));
  }
  var funs = {};
  function slideEvent(event) {
    (funs[event.currentSlide.id] || function(){})(event.currentSlide);
  }
  Reveal.addEventListener('slidechanged', slideEvent);
  Reveal.addEventListener('ready', slideEvent);
});
