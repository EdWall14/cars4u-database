<?php
$conn = new mysqli('127.0.0.1', 'phpuser', 'php123', 'cars4u');

if ($conn->connect_error) {
  die('Connection failed: ' . $conn->connect_error);
}

echo 'Connected successfully!<br>';

$result = $conn->query('SELECT Name, LicenceNo FROM Customer');
while ($row = $result->fetch_assoc()) {
  echo $row['Name'] . ' - ' . $row['LicenceNo'] . '<br>';
}

$conn->close();
?>
