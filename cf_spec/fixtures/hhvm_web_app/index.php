<html>
<head>
    <title>Simple</title>
</head>
<body>
<?php
  if (defined('HHVM_VERSION')) {
    echo '<p>App with HHVM running</p>';
  } else {
    echo '<p>App without HHVM running</p>';
  }
?>
</body>
</html>