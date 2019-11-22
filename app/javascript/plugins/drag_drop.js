import interact from 'interactjs'

// target elements with the "draggable" class
let card = document.querySelector('draggable')

interact('.draggable')
  .draggable({
    // enable inertial throwing


    inertia: true,
    // keep the element within the area of it's parent
    modifiers: [
      interact.modifiers.restrictRect({
        restriction: 'parent',
        endOnly: true
      })
    ],
    // enable autoScroll
    autoScroll: true,

    // call this function on every dragmove event
    onmove: dragMoveListener,
    // onmove: () => {},
    // call this function on every dragend event
    onend: function (event) {
      if (!event) {
        return;
      }

      var target = event.target

      if (!target) {
        return;
      }

      target.style.webkitTransform = target.style.transform = 'translate(0px, 0px)';
    }
  })

function dragMoveListener (event) {

  if (!event) {
    return;
  }

  var target = event.target

  if (!target) {
    return;
  }

  const petId = target.dataset.id;

  var booking_rectangle = document.querySelector('.booking_rectangle');
  var card = target.getBoundingClientRect();
  var rectangle = booking_rectangle.getBoundingClientRect();
  var distance = rectangle.top - card.top
  if ( distance <= 200 ) {
    $(".modal-" + petId).modal('show');
  };

  // keep the dragged position in the data-x/data-y attributes
  var x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx
  var y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy

  // translate the element
  target.style.webkitTransform =
    target.style.transform =
      'translate(' + x + 'px, ' + y + 'px)'

  // update the posiion attributes
  target.setAttribute('data-x', x)
  target.setAttribute('data-y', y)
}


// this is used later in the resizing and gesture demos
window.dragMoveListener = dragMoveListener

export { dragMoveListener };
