 $(document).ready(function() {
            $('.intro-heading').slick({
                dots: true,
                infinite: true,
                slidesToShow: 2,
                slidesToScroll: 2,
                autoplay: true,
                autoplaySpeed: 2000,
                arrows: true,
                centerMode: true,
                pauseOnHover: false,
            });


            /* 페이지를 최상단으로 부드럽게 이동*/



            $("#myBtn").click(function() {
                $("#myModal").modal({
                    backdrop: true
                });
            });



        }); /*end of ready script*/