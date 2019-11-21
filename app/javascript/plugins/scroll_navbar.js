const scrollNavbar = () => {
  $(window).scroll(function(){
    $('.navbar').toggleClass('scroll', $(this).scrollTop() > 900);
  });
};

export { scrollNavbar };
