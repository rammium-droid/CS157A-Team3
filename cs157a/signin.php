<?php
include "db_conn.php";
$email = $_POST['email_address'];
$password = $_POST['Password'];
if (empty($email) || empty($password)) {
    header("Location: loginfailed.php");
    exit();
}
else {
    $sql_buyer = "SELECT * FROM buyer WHERE email='$email' AND password='$password'";
    $sql_event_planner = "SELECT * FROM event_planner WHERE email='$email' AND password='$password'";
    $sql_admin = "SELECT * FROM admin WHERE email='$email' AND password='$password'";
    $result_buyer = mysqli_query($conn, $sql_buyer);
    $result_event_planner = mysqli_query($conn, $sql_event_planner);
    $result_admin = mysqli_query($conn, $sql_admin);
    if(mysqli_num_rows($result_buyer) !== 1 && mysqli_num_rows($result_event_planner) !== 1 && mysqli_num_rows($result_admin) !== 1) {
        header("Location: loginfailed.php");
        exit();
    }
}
?>