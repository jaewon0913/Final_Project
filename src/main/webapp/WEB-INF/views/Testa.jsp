<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800);
figure.snip1132 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 220px;
  max-width: 310px;
  max-height: 220px;
  width: 100%;
  background: #000000;
  color: #ffffff;
  text-align: center;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
}

figure.snip1132 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.45s ease-in-out;
  transition: all 0.45s ease-in-out;
}

figure.snip1132 img {
  max-width: 100%;
  position: relative;
  opacity: 1;
}

figure.snip1132 figcaption {
  position: absolute;
  top: 20px;
  left: 20px;
  right: 20px;
  bottom: 20px;
  border: 1px solid white;
  border-width: 0 1px;
}


figure.snip1132:hover img,
figure.snip1132.hover img {
  transform: scale(1.15);
}


</style>
</head>
<body>

<figure class="snip1132">
  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample22.jpg" alt="sample22" />
</figure>
<script type="text/javascript">
/* Demo purposes only  */
$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);
</script>

</body>
</html>