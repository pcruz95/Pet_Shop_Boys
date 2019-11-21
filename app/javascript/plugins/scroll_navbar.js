const scrollNavbar = () => {
  if (document.querySelector('#home-banner') !== null) {
    $(window).scroll(function(){
      $('.navbar').toggleClass('scroll', $(this).scrollTop() > 900);
    });
  } else {
    $(window).scroll(function(){
      $('.navbar').toggleClass('scroll', $(this).scrollTop() > 0);
    });
  }
};

export { scrollNavbar };
